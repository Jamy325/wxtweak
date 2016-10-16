#line 1 "/Users/jamy/works/wxtweak/wxtweak/wxtweak.xm"










#include "wxUtil.h"
#include <sys/stat.h>
#include <sys/types.h>
#import "KeychainItemWrapper.h"
#import "iToast.h"


NSString* md5HexDigest(NSString* input)
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
}


void UncaughtExceptionHandler(NSException* exception)
{
    NSString* name = [ exception name ];
    NSString* reason = [ exception reason ];
    NSArray* symbols = [ exception callStackSymbols ]; 
    NSMutableString* strSymbols = [ [ NSMutableString alloc ] init ]; 
    for ( NSString* item in symbols )
    {
        [ strSymbols appendString: item ];
        [ strSymbols appendString: @"\r\n" ];
    }
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *logDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
  
  
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:logDirectory]) {
		[fileManager createDirectoryAtPath:logDirectory  withIntermediateDirectories:YES attributes:nil error:nil];
	}
    
    NSString *logFilePath = [logDirectory stringByAppendingPathComponent:@"UncaughtException.log"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    
    NSString *crashString = [NSString stringWithFormat:@"<- %@ ->[ Uncaught Exception ]\r\nName: %@, Reason: %@\r\n[ Fe Symbols Start ]\r\n%@[ Fe Symbols End ]\r\n\r\n", dateStr, name, reason, strSymbols];
    
    if (![fileManager fileExistsAtPath:logFilePath]) {
        [crashString writeToFile:logFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }else{
        NSFileHandle *outFile = [NSFileHandle fileHandleForWritingAtPath:logFilePath];
        [outFile seekToEndOfFile];
        [outFile writeData:[crashString dataUsingEncoding:NSUTF8StringEncoding]];
        [outFile closeFile];
    }
    
    
    
    
    
}


void redirectWXLogToDocumentFolder()
{
    
    if(isatty(STDOUT_FILENO)) {
        return;
    }
    
    UIDevice *device = [UIDevice currentDevice];
    if([[device model] hasSuffix:@"Simulator"]){ 
        return;
    }
    
    
      NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *logDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
    
    
 
  
    
    
    NSString* delLogCmd = [NSString stringWithFormat:@"find %@/*.log -mtime +5 -exec rm -rf {} \\;", logDirectory];

    NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL fileExists = [fileManager fileExistsAtPath:logDirectory];
    if (!fileExists) {
		[fileManager createDirectoryAtPath:logDirectory  withIntermediateDirectories:YES attributes:nil error:nil];
	}
    
    WXLog(@"%@", delLogCmd);
    const char* strCmd = [delLogCmd UTF8String];
    system(strCmd);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"]; 
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    NSString *logFilePath = [logDirectory stringByAppendingFormat:@"/%@.log",dateStr];
    
    
    
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    
  
  
    
    
    
    NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
}



bool checkPluginCanUse()
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *tmpdir = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"/Log/config.dat"];
    BOOL fileExists = [fileManager fileExistsAtPath:tmpdir];
   WXLog(@"=========================file is exist:%@ %d", tmpdir, fileExists);
    
    if (!fileExists) {
        NSString *tmp = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"tmp"];
        fileExists = [fileManager fileExistsAtPath:tmp];
        
        if(!fileExists)
            return false;
        
        NSDictionary* fileAttribute = [[NSFileManager defaultManager] fileAttributesAtPath:tmp traverseLink:YES];
        NSDate* d = (NSDate*)[fileAttribute objectForKey:NSFileModificationDate];
        NSDate* curTime = [NSDate date];
        
        
        NSTimeInterval d1970 = [d timeIntervalSince1970];
        NSTimeInterval cur1970 = [curTime timeIntervalSince1970];
        NSTimeInterval delta = cur1970 - d1970;
        
        
        WXLog(@"--------------======:d:%f, cur:%f, delta:%f", d1970, cur1970, delta);
        if (delta > 0 && delta < 3*24*60*60) return true;
        return false;
	}
    
    NSString* str = [[NSString alloc] initWithContentsOfFile: tmpdir encoding:NSUTF8StringEncoding error:nil];
    
    int length = [str length];
    
    if (length < 32) return false;
    
    NSString* key = [str substringWithRange:NSMakeRange(0, length - 32)];
    NSString* result = [str substringWithRange:NSMakeRange(length - 32, 32)];
    
    NSString* md51 = md5HexDigest([NSString stringWithFormat:@"%@wxtweak", key]);
    NSString* md52 = md5HexDigest([NSString stringWithFormat:@"%@jamy", md51]);
    
  
    
    if ([md52 isEqualToString:result]){
     
        return true;
    }
   
  
    return false;
}


#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

#include <substrate.h>
@class MicroMessengerAppDelegate; @class NSBundle; @class WCPayTouchIDAuthHelper; @class ClientCheckMgr; @class MMUploadFileViewController; @class iAPMgr; @class JailBreakHelper; @class MMUploadDataViewController; @class WtloginPlatformInfo; 
static id (*_logos_meta_orig$_ungrouped$ClientCheckMgr$sharedInstance)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$ClientCheckMgr$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ClientCheckMgr$checkHook$)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClientCheckMgr$checkHook$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$ClientCheckMgr$runningProcesses)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$ClientCheckMgr$runningProcesses(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ClientCheckMgr$checkConsistency$)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClientCheckMgr$checkConsistency$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$ClientCheckMgr$reportAppList$)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClientCheckMgr$reportAppList$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$ClientCheckMgr$reportFileConsistency$fileName$offset$bufferSize$seq$)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id, id, unsigned int, unsigned int, unsigned int); static void _logos_method$_ungrouped$ClientCheckMgr$reportFileConsistency$fileName$offset$bufferSize$seq$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id, id, unsigned int, unsigned int, unsigned int); static id (*_logos_meta_orig$_ungrouped$JailBreakHelper$loadSetting)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$JailBreakHelper$loadSetting(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$JailBreakHelper$getIAPCheckPath)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$JailBreakHelper$getIAPCheckPath(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$JailBreakHelper$getJailbreakPath)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$JailBreakHelper$getJailbreakPath(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$JailBreakHelper$getJailbreakRootDir)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$JailBreakHelper$getJailbreakRootDir(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$JailBreakHelper$initialize)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_meta_method$_ungrouped$JailBreakHelper$initialize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$JailBreakHelper$onPackageListUpdated$)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$JailBreakHelper$onPackageListUpdated$(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$JailBreakHelper$onPackageDownloadProcessUpdated$downloadSize$totalSize$)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL, id, int, int); static void _logos_method$_ungrouped$JailBreakHelper$onPackageDownloadProcessUpdated$downloadSize$totalSize$(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL, id, int, int); static void (*_logos_orig$_ungrouped$JailBreakHelper$onPackageDownloadFinish$package$)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$JailBreakHelper$onPackageDownloadFinish$package$(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL, id, id); static _Bool (*_logos_orig$_ungrouped$JailBreakHelper$save)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$JailBreakHelper$save(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$JailBreakHelper$HasInstallJailbreakPluginInvalidIAPPurchase)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$JailBreakHelper$HasInstallJailbreakPluginInvalidIAPPurchase(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$JailBreakHelper$isOverADay)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$JailBreakHelper$isOverADay(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$JailBreakHelper$HasInstallJailbreakPlugin$)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_method$_ungrouped$JailBreakHelper$HasInstallJailbreakPlugin$(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$JailBreakHelper$IsJailBreak)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$JailBreakHelper$IsJailBreak(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$JailBreakHelper$getKeyStr)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$JailBreakHelper$getKeyStr(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static JailBreakHelper* (*_logos_orig$_ungrouped$JailBreakHelper$init)(_LOGOS_SELF_TYPE_INIT JailBreakHelper*, SEL) _LOGOS_RETURN_RETAINED; static JailBreakHelper* _logos_method$_ungrouped$JailBreakHelper$init(_LOGOS_SELF_TYPE_INIT JailBreakHelper*, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$JailBreakHelper$dealloc)(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$JailBreakHelper$dealloc(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$logAbTestItem$transactionId$event$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id, int); static void _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$logAbTestItem$transactionId$event$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id, int); static _Bool (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailableAndNotJailBreak)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailableAndNotJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailable)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailable(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupportedAndNotJailBreak)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupportedAndNotJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupported)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupported(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceJailBreak)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isInWhiteList$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isInWhiteList$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$canUseTouchIDFromData$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$canUseTouchIDFromData$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void (*_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$showTouchIDAuthView$whenSuccess$whenFail$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id, id); static void _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$showTouchIDAuthView$whenSuccess$whenFail$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id, id); static _Bool (*_logos_orig$_ungrouped$MMUploadFileViewController$isJailbreak)(_LOGOS_SELF_TYPE_NORMAL MMUploadFileViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$MMUploadFileViewController$isJailbreak(_LOGOS_SELF_TYPE_NORMAL MMUploadFileViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MMUploadFileViewController$writeMailWithFileInformation$)(_LOGOS_SELF_TYPE_NORMAL MMUploadFileViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$MMUploadFileViewController$writeMailWithFileInformation$(_LOGOS_SELF_TYPE_NORMAL MMUploadFileViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$MMUploadDataViewController$writeMailWithAttachFile$zipName$zipPath$)(_LOGOS_SELF_TYPE_NORMAL MMUploadDataViewController* _LOGOS_SELF_CONST, SEL, id, id, id); static void _logos_method$_ungrouped$MMUploadDataViewController$writeMailWithAttachFile$zipName$zipPath$(_LOGOS_SELF_TYPE_NORMAL MMUploadDataViewController* _LOGOS_SELF_CONST, SEL, id, id, id); static _Bool (*_logos_orig$_ungrouped$MMUploadDataViewController$isJailbreak)(_LOGOS_SELF_TYPE_NORMAL MMUploadDataViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$MMUploadDataViewController$isJailbreak(_LOGOS_SELF_TYPE_NORMAL MMUploadDataViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$iAPMgr$cannotPurchaseDuetoJailbreakPlugin$)(_LOGOS_SELF_TYPE_NORMAL iAPMgr* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$iAPMgr$cannotPurchaseDuetoJailbreakPlugin$(_LOGOS_SELF_TYPE_NORMAL iAPMgr* _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$_checkDevice)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$_checkDevice(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$guidForReport)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$guidForReport(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$writeSigDataTofile)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$writeSigDataTofile(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$printAllMemsig)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$printAllMemsig(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$appMainBundleIndentify)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$appMainBundleIndentify(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$appBundleVersion)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$appBundleVersion(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$appBundleShortVersionString)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$appBundleShortVersionString(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginAppVer)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$lastLoginAppVer(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginSdkVer)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$lastLoginSdkVer(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static unsigned int (*_logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginTime)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static unsigned int _logos_method$_ungrouped$WtloginPlatformInfo$lastLoginTime(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$WtloginPlatformInfo$resetLastLoginInfo)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$resetLastLoginInfo(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static unsigned int (*_logos_orig$_ungrouped$WtloginPlatformInfo$sigVailidateBySigType$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, unsigned int); static unsigned int _logos_method$_ungrouped$WtloginPlatformInfo$sigVailidateBySigType$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, unsigned int); static _Bool (*_logos_orig$_ungrouped$WtloginPlatformInfo$setSigVailidateTime$bySigType$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, unsigned int, unsigned int); static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setSigVailidateTime$bySigType$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, unsigned int, unsigned int); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$clearNameToUin$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$WtloginPlatformInfo$clearNameToUin$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$WtloginPlatformInfo$setNameToConfig$forUin$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, unsigned int); static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setNameToConfig$forUin$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, unsigned int); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$clearPwdSigUser$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, unsigned int); static void _logos_method$_ungrouped$WtloginPlatformInfo$clearPwdSigUser$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, unsigned int); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$pwdSigUser$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, unsigned int); static id _logos_method$_ungrouped$WtloginPlatformInfo$pwdSigUser$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, unsigned int); static _Bool (*_logos_orig$_ungrouped$WtloginPlatformInfo$setSavePwdSigToConfig$forAccount$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, unsigned int); static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setSavePwdSigToConfig$forAccount$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, unsigned int); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$resetKeyChain)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$resetKeyChain(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$ksidForUser$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$_ungrouped$WtloginPlatformInfo$ksidForUser$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$WtloginPlatformInfo$setKsidToConfig$forAccount$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, id); static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setKsidToConfig$forAccount$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, id); static _Bool (*_logos_orig$_ungrouped$WtloginPlatformInfo$setKsidToKeyChain$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setKsidToKeyChain$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$ksidFromKeyChain)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$ksidFromKeyChain(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$tgtgtKeyFromKeyChain)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$tgtgtKeyFromKeyChain(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$crtCarrierName)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$crtCarrierName(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static int (*_logos_orig$_ungrouped$WtloginPlatformInfo$netState)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static int _logos_method$_ungrouped$WtloginPlatformInfo$netState(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$setConfigObject$forKey$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$WtloginPlatformInfo$setConfigObject$forKey$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$configObjectForKey$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$_ungrouped$WtloginPlatformInfo$configObjectForKey$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$dealloc)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$dealloc(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$wtloginPlatformDataInit)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$wtloginPlatformDataInit(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static WtloginPlatformInfo* (*_logos_orig$_ungrouped$WtloginPlatformInfo$init)(_LOGOS_SELF_TYPE_INIT WtloginPlatformInfo*, SEL) _LOGOS_RETURN_RETAINED; static WtloginPlatformInfo* _logos_method$_ungrouped$WtloginPlatformInfo$init(_LOGOS_SELF_TYPE_INIT WtloginPlatformInfo*, SEL) _LOGOS_RETURN_RETAINED; static _Bool (*_logos_orig$_ungrouped$WtloginPlatformInfo$tryDecrypt$byKey$andOutData$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, id, id); static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$tryDecrypt$byKey$andOutData$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id, id, id); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$getDeviceVersion)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$getDeviceVersion(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static int (*_logos_orig$_ungrouped$WtloginPlatformInfo$writeGuidToPasteBoard$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static int _logos_method$_ungrouped$WtloginPlatformInfo$writeGuidToPasteBoard$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static int (*_logos_orig$_ungrouped$WtloginPlatformInfo$readGuidArrayFromPasteBoard$)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static int _logos_method$_ungrouped$WtloginPlatformInfo$readGuidArrayFromPasteBoard$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$genGuid)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$genGuid(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WtloginPlatformInfo$macaddress)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WtloginPlatformInfo$macaddress(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$GetHWAddresses)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$GetHWAddresses(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$GetIPAddresses)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$GetIPAddresses(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$FreeAddresses)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$FreeAddresses(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WtloginPlatformInfo$InitAddresses)(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WtloginPlatformInfo$InitAddresses(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST, SEL); 

#line 187 "/Users/jamy/works/wxtweak/wxtweak/wxtweak.xm"



static id _logos_meta_method$_ungrouped$ClientCheckMgr$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
	HBLogDebug(@"+[<ClientCheckMgr: %p> sharedInstance]", self);

	return _logos_meta_orig$_ungrouped$ClientCheckMgr$sharedInstance(self, _cmd);
}


static void _logos_method$_ungrouped$ClientCheckMgr$checkHook$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST self, SEL _cmd, id originalArgument) {
	HBLogDebug(@"-[<ClientCheckMgr: %p> checkHook:%@]", self, originalArgument);
    return;
	
	
	
}


static id _logos_method$_ungrouped$ClientCheckMgr$runningProcesses(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST self, SEL _cmd) {
	HBLogDebug(@"-[<ClientCheckMgr: %p> runningProcesses]", self);

	id originalReturnOfMessage = _logos_orig$_ungrouped$ClientCheckMgr$runningProcesses(self, _cmd);
	
	
    WXLog(@"runningProcesses result:%@", originalReturnOfMessage);

	return originalReturnOfMessage;
}


static void _logos_method$_ungrouped$ClientCheckMgr$checkConsistency$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"-[<ClientCheckMgr: %p> checkConsistency:%@]", self, arg1);
    return;
}


static void _logos_method$_ungrouped$ClientCheckMgr$reportAppList$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"-[<ClientCheckMgr: %p> reportAppList:%@]", self, arg1);
    return;
}


static void _logos_method$_ungrouped$ClientCheckMgr$reportFileConsistency$fileName$offset$bufferSize$seq$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2, unsigned int arg3, unsigned int arg4, unsigned int arg5) {
    HBLogDebug(@"-[<ClientCheckMgr: %p> reportFileConsistency:%@ fileName:%@ offset:%u bufferSize:%u seq:%u]", self, arg1, arg2, arg3, arg4, arg5);
    return;
}







static id _logos_meta_method$_ungrouped$JailBreakHelper$loadSetting(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
      HBLogDebug(@"+[<JailBreakHelper: %p> loadSetting]", self);
    return nil;
}

static id _logos_meta_method$_ungrouped$JailBreakHelper$getIAPCheckPath(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
      HBLogDebug(@"+[<JailBreakHelper: %p> getIAPCheckPath]", self);
    return @"";
}

static id _logos_meta_method$_ungrouped$JailBreakHelper$getJailbreakPath(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"+[<JailBreakHelper: %p> getJailbreakPath]", self);
    return @"";
}

static id _logos_meta_method$_ungrouped$JailBreakHelper$getJailbreakRootDir(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"+[<JailBreakHelper: %p> getJailbreakRootDir]", self);
    return @"";
}

static void _logos_meta_method$_ungrouped$JailBreakHelper$initialize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"+[<JailBreakHelper: %p> initialize]", self);
    return;
}


static void _logos_method$_ungrouped$JailBreakHelper$onPackageListUpdated$(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"-[<JailBreakHelper: %p> onPackageListUpdated:%@]", self, arg1);
    return;
}


static void _logos_method$_ungrouped$JailBreakHelper$onPackageDownloadProcessUpdated$downloadSize$totalSize$(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, int arg2, int arg3) {
    HBLogDebug(@"-[<JailBreakHelper: %p> onPackageDownloadProcessUpdated:%@ downloadSize:%d totalSize:%d]", self, arg1, arg2, arg3);
    return _logos_orig$_ungrouped$JailBreakHelper$onPackageDownloadProcessUpdated$downloadSize$totalSize$(self, _cmd, arg1, arg2, arg3);
}


static void _logos_method$_ungrouped$JailBreakHelper$onPackageDownloadFinish$package$(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2) {
    HBLogDebug(@"-[<JailBreakHelper: %p> onPackageDownloadFinish:%@ package:%@]", self, arg1, arg2);
    return _logos_orig$_ungrouped$JailBreakHelper$onPackageDownloadFinish$package$(self, _cmd, arg1, arg2);
}


static _Bool _logos_method$_ungrouped$JailBreakHelper$save(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<JailBreakHelper: %p> save]", self);
    return YES;
}


static _Bool _logos_method$_ungrouped$JailBreakHelper$HasInstallJailbreakPluginInvalidIAPPurchase(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<JailBreakHelper: %p> HasInstallJailbreakPluginInvalidIAPPurchase]", self);
    return NO;
}


static _Bool _logos_method$_ungrouped$JailBreakHelper$isOverADay(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<JailBreakHelper: %p> isOverADay]", self);
    return NO;
}


static _Bool _logos_method$_ungrouped$JailBreakHelper$HasInstallJailbreakPlugin$(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"-[<JailBreakHelper: %p> HasInstallJailbreakPlugin:%@]", self, arg1);
    return NO;
}

static _Bool _logos_method$_ungrouped$JailBreakHelper$IsJailBreak(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<JailBreakHelper: %p> IsJailBreak]", self);
    return NO;
}

static id _logos_method$_ungrouped$JailBreakHelper$getKeyStr(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<JailBreakHelper: %p> getKeyStr]", self);
    return @"";
}

static JailBreakHelper* _logos_method$_ungrouped$JailBreakHelper$init(_LOGOS_SELF_TYPE_INIT JailBreakHelper* self, SEL _cmd) _LOGOS_RETURN_RETAINED {
    HBLogDebug(@"-[<JailBreakHelper: %p> init]", self);
    return 0;
}
static void _logos_method$_ungrouped$JailBreakHelper$dealloc(_LOGOS_SELF_TYPE_NORMAL JailBreakHelper* _LOGOS_SELF_CONST self, SEL _cmd){
    HBLogDebug(@"-[<JailBreakHelper: %p> dealloc]", self);
    return;
}








static void _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$logAbTestItem$transactionId$event$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2, int arg3) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> logAbTestItem:%@ transactionId:%@ event:%d]", self, arg1, arg2, arg3);
    _logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$logAbTestItem$transactionId$event$(self, _cmd, arg1, arg2, arg3);
}


static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailableAndNotJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> isDeviceTouchIDAvailableAndNotJailBreak]", self);
    return YES;
}

static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailable(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> isDeviceTouchIDAvailable]", self);
    return NO;
}

static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupportedAndNotJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> isDeviceTouchIDHardwareSupportedAndNotJailBreak]", self);
    return NO;
}

static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupported(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> isDeviceTouchIDHardwareSupported]", self);
    return NO;
}


static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> isDeviceJailBreak]", self);
    return NO;
}


static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isInWhiteList$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> isInWhiteList:%@]", self, arg1);
    return YES;
}


static _Bool _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$canUseTouchIDFromData$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> canUseTouchIDFromData:%@]", self, arg1);
    return _logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$canUseTouchIDFromData$(self, _cmd, arg1);

}


static void _logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$showTouchIDAuthView$whenSuccess$whenFail$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2, id arg3) {
    HBLogDebug(@"+[<WCPayTouchIDAuthHelper: %p> showTouchIDAuthView:%@ whenSuccess:%@ whenFail:%@]", self, arg1, arg2, arg3);
    return _logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$showTouchIDAuthView$whenSuccess$whenFail$(self, _cmd, arg1, arg2, arg3);

}







static _Bool _logos_method$_ungrouped$MMUploadFileViewController$isJailbreak(_LOGOS_SELF_TYPE_NORMAL MMUploadFileViewController* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<MMUploadFileViewController: %p> isJailbreak]", self);
    return NO;
}


static void _logos_method$_ungrouped$MMUploadFileViewController$writeMailWithFileInformation$(_LOGOS_SELF_TYPE_NORMAL MMUploadFileViewController* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"-[<MMUploadFileViewController: %p> writeMailWithFileInformation:%@]", self, arg1);
    return;
}






static void _logos_method$_ungrouped$MMUploadDataViewController$writeMailWithAttachFile$zipName$zipPath$(_LOGOS_SELF_TYPE_NORMAL MMUploadDataViewController* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2, id arg3) {
    HBLogDebug(@"-[<MMUploadDataViewController: %p> writeMailWithAttachFile:%@ zipName:%@ zipPath:%@]", self, arg1, arg2, arg3);
    return;
}

static _Bool _logos_method$_ungrouped$MMUploadDataViewController$isJailbreak(_LOGOS_SELF_TYPE_NORMAL MMUploadDataViewController* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<MMUploadDataViewController: %p> isJailbreak]", self);
    return NO;
}







static _Bool _logos_method$_ungrouped$iAPMgr$cannotPurchaseDuetoJailbreakPlugin$(_LOGOS_SELF_TYPE_NORMAL iAPMgr* _LOGOS_SELF_CONST self, SEL _cmd, _Bool arg1) {
    HBLogDebug(@"-[<iAPMgr: %p> cannotPurchaseDuetoJailbreakPlugin:%d]", self, arg1);
    return YES;
}












static void _logos_method$_ungrouped$WtloginPlatformInfo$_checkDevice(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogInfo(@"_checkDevice cancel");
}


static id _logos_method$_ungrouped$WtloginPlatformInfo$guidForReport(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$guidForReport(self, _cmd);
    HBLogInfo(@"%@", r);
    return r;
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$writeSigDataTofile(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    return _logos_orig$_ungrouped$WtloginPlatformInfo$writeSigDataTofile(self, _cmd);
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$printAllMemsig(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    return _logos_orig$_ungrouped$WtloginPlatformInfo$printAllMemsig(self, _cmd);
}


static id _logos_method$_ungrouped$WtloginPlatformInfo$appMainBundleIndentify(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    NSString* str = _logos_orig$_ungrouped$WtloginPlatformInfo$appMainBundleIndentify(self, _cmd);
    WXLog(@"appMainBundleIndentify:%@ change to com.tencent.xin", str);
    return @"com.tencent.xin";
}

static id _logos_method$_ungrouped$WtloginPlatformInfo$appBundleVersion(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$appBundleVersion(self, _cmd);
    HBLogInfo(@"%@", r);
    return r;
}


static id _logos_method$_ungrouped$WtloginPlatformInfo$appBundleShortVersionString(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$appBundleShortVersionString(self, _cmd);
    HBLogInfo(@"%@", r);
    return r;
}


static id _logos_method$_ungrouped$WtloginPlatformInfo$lastLoginAppVer(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginAppVer(self, _cmd);
    HBLogInfo(@"%@", r);
    return r;
}


static id _logos_method$_ungrouped$WtloginPlatformInfo$lastLoginSdkVer(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginSdkVer(self, _cmd);
    HBLogInfo(@"%@", r);
    return r;
}

static unsigned int _logos_method$_ungrouped$WtloginPlatformInfo$lastLoginTime(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    int r = _logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginTime(self, _cmd);
    HBLogInfo(@"%d", r);
    return r;
}

static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$resetLastLoginInfo(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    _Bool r = _logos_orig$_ungrouped$WtloginPlatformInfo$resetLastLoginInfo(self, _cmd);
    HBLogInfo(@"%d", r);
    return r;
}


static unsigned int _logos_method$_ungrouped$WtloginPlatformInfo$sigVailidateBySigType$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, unsigned int arg1) {
    _Bool r = _logos_orig$_ungrouped$WtloginPlatformInfo$sigVailidateBySigType$(self, _cmd, arg1);
    HBLogInfo(@"arg1:%d,ret:%d", arg1, r);
    return r;
}


static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setSigVailidateTime$bySigType$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, unsigned int arg1, unsigned int arg2) {
    _Bool r = _logos_orig$_ungrouped$WtloginPlatformInfo$setSigVailidateTime$bySigType$(self, _cmd, arg1, arg2);
    HBLogInfo(@"arg1:%d, arg2:%d,ret:%d", arg1, arg2, r);
    return r;
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$clearNameToUin$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    _logos_orig$_ungrouped$WtloginPlatformInfo$clearNameToUin$(self, _cmd, arg1);
    HBLogInfo(@"arg1:%@", arg1);
   
}


static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setNameToConfig$forUin$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, unsigned int arg2) {
    _Bool r = _logos_orig$_ungrouped$WtloginPlatformInfo$setNameToConfig$forUin$(self, _cmd, arg1, arg2);
    HBLogInfo(@"arg1:%@, arg2:%d,ret:%d", arg1, arg2, r);
    return r;
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$clearPwdSigUser$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, unsigned int arg1) {
    _logos_orig$_ungrouped$WtloginPlatformInfo$clearPwdSigUser$(self, _cmd, arg1);
    HBLogInfo(@"arg1:%d", arg1);
}



static id _logos_method$_ungrouped$WtloginPlatformInfo$pwdSigUser$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, unsigned int arg1) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$pwdSigUser$(self, _cmd, arg1);
    HBLogInfo(@"arg1:%d,ret:%@", arg1, r);
    return r;
}



static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setSavePwdSigToConfig$forAccount$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, unsigned int arg2) {
    _Bool r = _logos_orig$_ungrouped$WtloginPlatformInfo$setSavePwdSigToConfig$forAccount$(self, _cmd, arg1, arg2);
    HBLogInfo(@"arg1:%@, arg2:%d,ret:%d", arg1, arg2, r);
    return r;
}



static void _logos_method$_ungrouped$WtloginPlatformInfo$resetKeyChain(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogInfo(@"resetkeychain");
}


static id _logos_method$_ungrouped$WtloginPlatformInfo$ksidForUser$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$ksidForUser$(self, _cmd, arg1);
    HBLogInfo(@"arg1:%@,ret:%@", arg1, r);
    return r;
}



static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setKsidToConfig$forAccount$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2) {
    _Bool r = _logos_orig$_ungrouped$WtloginPlatformInfo$setKsidToConfig$forAccount$(self, _cmd, arg1, arg2);
    HBLogInfo(@"arg1:%@, arg2:%@,ret:%d", arg1, arg2, r);
    return r;
}


static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$setKsidToKeyChain$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    _Bool r = _logos_orig$_ungrouped$WtloginPlatformInfo$setKsidToKeyChain$(self, _cmd, arg1);
    HBLogInfo(@"arg1:%@,ret:%d", arg1, r);
    return r;
}



static id _logos_method$_ungrouped$WtloginPlatformInfo$ksidFromKeyChain(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$ksidFromKeyChain(self, _cmd);
    HBLogInfo(@"ret:%@", r);
    return r;
}


static id _logos_method$_ungrouped$WtloginPlatformInfo$tgtgtKeyFromKeyChain(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$tgtgtKeyFromKeyChain(self, _cmd);
    HBLogInfo(@"ret:%@", r);
    return r;
}



static id _logos_method$_ungrouped$WtloginPlatformInfo$crtCarrierName(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$crtCarrierName(self, _cmd);
    HBLogInfo(@"ret:%@", r);
    return r;
}


static int _logos_method$_ungrouped$WtloginPlatformInfo$netState(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    int r = _logos_orig$_ungrouped$WtloginPlatformInfo$netState(self, _cmd);
    HBLogInfo(@"ret:%d", r);
    return r;
}



static void _logos_method$_ungrouped$WtloginPlatformInfo$setConfigObject$forKey$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2) {
    _logos_orig$_ungrouped$WtloginPlatformInfo$setConfigObject$forKey$(self, _cmd, arg1, arg2);
    HBLogInfo(@"arg1:%@, arg2:%@", arg1, arg2);
}



static id _logos_method$_ungrouped$WtloginPlatformInfo$configObjectForKey$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    id r = _logos_orig$_ungrouped$WtloginPlatformInfo$configObjectForKey$(self, _cmd, arg1);
    HBLogInfo(@" arg1:%@, ret:%@", arg1, r);
    return r;
}



static void _logos_method$_ungrouped$WtloginPlatformInfo$dealloc(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<WtloginPlatformInfo: %p> dealloc]", self);
    return _logos_orig$_ungrouped$WtloginPlatformInfo$dealloc(self, _cmd);
}




static void _logos_method$_ungrouped$WtloginPlatformInfo$wtloginPlatformDataInit(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<WtloginPlatformInfo: %p> wtloginPlatformDataInit]", self);
    return _logos_orig$_ungrouped$WtloginPlatformInfo$wtloginPlatformDataInit(self, _cmd);
}

static WtloginPlatformInfo* _logos_method$_ungrouped$WtloginPlatformInfo$init(_LOGOS_SELF_TYPE_INIT WtloginPlatformInfo* self, SEL _cmd) _LOGOS_RETURN_RETAINED {
    HBLogDebug(@"-[<WtloginPlatformInfo: %p> init]", self);
    return _logos_orig$_ungrouped$WtloginPlatformInfo$init(self, _cmd);
}

static _Bool _logos_method$_ungrouped$WtloginPlatformInfo$tryDecrypt$byKey$andOutData$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2, id arg3) {
    HBLogDebug(@"-[<WtloginPlatformInfo: %p> tryDecrypt:%@ byKey:%@ andOutData:%@]", self, arg1, arg2, arg3);
    return _logos_orig$_ungrouped$WtloginPlatformInfo$tryDecrypt$byKey$andOutData$(self, _cmd, arg1, arg2, arg3);
}


static id _logos_method$_ungrouped$WtloginPlatformInfo$getDeviceVersion(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    WXLog(@"getDeviceVersion %@ change to 9.3.1", _logos_orig$_ungrouped$WtloginPlatformInfo$getDeviceVersion(self, _cmd));
    return @"9.3.1";
}



static int _logos_method$_ungrouped$WtloginPlatformInfo$writeGuidToPasteBoard$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    int r = _logos_orig$_ungrouped$WtloginPlatformInfo$writeGuidToPasteBoard$(self, _cmd, arg1);
    HBLogInfo(@"arg1:%@, ret:%d", arg1, r);
    return r;
}


static int _logos_method$_ungrouped$WtloginPlatformInfo$readGuidArrayFromPasteBoard$(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    int r = _logos_orig$_ungrouped$WtloginPlatformInfo$readGuidArrayFromPasteBoard$(self, _cmd, arg1);
    HBLogInfo(@"arg1:%@, ret:%d", arg1, r);
    return r;
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$genGuid(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogInfo(@" call");
    return _logos_orig$_ungrouped$WtloginPlatformInfo$genGuid(self, _cmd);
}



static id _logos_method$_ungrouped$WtloginPlatformInfo$macaddress(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    WXLog(@"macaddress %@ change 02:00:00:00:00", _logos_orig$_ungrouped$WtloginPlatformInfo$macaddress(self, _cmd));
    return @"02:00:00:00:00:00";
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$GetHWAddresses(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    WXLog(@"GetHWAddresses cancel");
    return;
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$GetIPAddresses(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    WXLog(@"GetIPAddresses cancel");
    return _logos_orig$_ungrouped$WtloginPlatformInfo$GetIPAddresses(self, _cmd);
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$FreeAddresses(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    WXLog(@"FreeAddresses cancel");
    return;
}


static void _logos_method$_ungrouped$WtloginPlatformInfo$InitAddresses(_LOGOS_SELF_TYPE_NORMAL WtloginPlatformInfo* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<WtloginPlatformInfo: %p> InitAddresses]", self);
    return _logos_orig$_ungrouped$WtloginPlatformInfo$InitAddresses(self, _cmd);
}



static _Bool (*_logos_orig$AWAYS_CREATE$MicroMessengerAppDelegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST, SEL, id, id); static _Bool _logos_method$AWAYS_CREATE$MicroMessengerAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST, SEL, id, id); static NSString * (*_logos_orig$AWAYS_CREATE$NSBundle$bundleIdentifier)(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$AWAYS_CREATE$NSBundle$bundleIdentifier(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST, SEL); 


static _Bool _logos_method$AWAYS_CREATE$MicroMessengerAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL MicroMessengerAppDelegate* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, id arg2) {
    HBLogDebug(@"-[<MicroMessengerAppDelegate: %p> application:%@ didFinishLaunchingWithOptions:%@]", self, arg1, arg2);
    _Bool r = _logos_orig$AWAYS_CREATE$MicroMessengerAppDelegate$application$didFinishLaunchingWithOptions$(self, _cmd, arg1, arg2);
    
#ifdef DEBUG
    redirectWXLogToDocumentFolder();
    [NSClassFromString(@"WebView") performSelector:@selector(_enableRemoteInspector)];
    
#endif
    
 
    if (checkPluginCanUse()){
        WXLog(@" ------------- plugin can use");
        [[[[iToast makeText:NSLocalizedString(@"恭喜您，当前微信已启用防封号插件", @"")] setGravity:iToastGravityCenter]
         setDuration:3000] show];
    }
    else{
        [[[[iToast makeText:NSLocalizedString(@"防封号插件未激活，您存在被封号风险！！", @"")] setGravity:iToastGravityCenter]
         setDuration:3000] show];
        WXLog(@" ------------- plugin can not use");
        exit(0);
    }
    return r;
}






static NSString * _logos_method$AWAYS_CREATE$NSBundle$bundleIdentifier(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<NSBundle: %p> bundleIdentifier]", self);
  
    NSArray* symbos = [NSThread callStackSymbols];
    
    NSRange range = [[symbos objectAtIndex:1] rangeOfString:@"1   WeChat"];
    
    NSString* old = _logos_orig$AWAYS_CREATE$NSBundle$bundleIdentifier(self, _cmd);
    
    if (range.location != NSNotFound){
        WXLog(@"orgin:%@,change to:com.tencent.xin", old);
        return @"com.tencent.xin";
    }
    
     WXLog(@"bundle id :%@", old);
    return old;
}




static __attribute__((constructor)) void _logosLocalCtor_f15a9b34(int argc, char **argv, char **envp) {


    {Class _logos_class$AWAYS_CREATE$MicroMessengerAppDelegate = objc_getClass("MicroMessengerAppDelegate"); if (_logos_class$AWAYS_CREATE$MicroMessengerAppDelegate) {MSHookMessageEx(_logos_class$AWAYS_CREATE$MicroMessengerAppDelegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$AWAYS_CREATE$MicroMessengerAppDelegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$AWAYS_CREATE$MicroMessengerAppDelegate$application$didFinishLaunchingWithOptions$);} else {HBLogError(@"logos: nil class %s", "MicroMessengerAppDelegate");}Class _logos_class$AWAYS_CREATE$NSBundle = objc_getClass("NSBundle"); if (_logos_class$AWAYS_CREATE$NSBundle) {MSHookMessageEx(_logos_class$AWAYS_CREATE$NSBundle, @selector(bundleIdentifier), (IMP)&_logos_method$AWAYS_CREATE$NSBundle$bundleIdentifier, (IMP*)&_logos_orig$AWAYS_CREATE$NSBundle$bundleIdentifier);} else {HBLogError(@"logos: nil class %s", "NSBundle");}}  if (checkPluginCanUse()){
     {Class _logos_class$_ungrouped$ClientCheckMgr = objc_getClass("ClientCheckMgr"); Class _logos_metaclass$_ungrouped$ClientCheckMgr = object_getClass(_logos_class$_ungrouped$ClientCheckMgr); if (_logos_metaclass$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_metaclass$_ungrouped$ClientCheckMgr, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$ClientCheckMgr$sharedInstance, (IMP*)&_logos_meta_orig$_ungrouped$ClientCheckMgr$sharedInstance);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}if (_logos_class$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(checkHook:), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$checkHook$, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$checkHook$);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}if (_logos_class$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(runningProcesses), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$runningProcesses, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$runningProcesses);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}if (_logos_class$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(checkConsistency:), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$checkConsistency$, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$checkConsistency$);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}if (_logos_class$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(reportAppList:), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$reportAppList$, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$reportAppList$);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}if (_logos_class$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(reportFileConsistency:fileName:offset:bufferSize:seq:), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$reportFileConsistency$fileName$offset$bufferSize$seq$, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$reportFileConsistency$fileName$offset$bufferSize$seq$);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}Class _logos_class$_ungrouped$JailBreakHelper = objc_getClass("JailBreakHelper"); Class _logos_metaclass$_ungrouped$JailBreakHelper = object_getClass(_logos_class$_ungrouped$JailBreakHelper); if (_logos_metaclass$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$JailBreakHelper, @selector(loadSetting), (IMP)&_logos_meta_method$_ungrouped$JailBreakHelper$loadSetting, (IMP*)&_logos_meta_orig$_ungrouped$JailBreakHelper$loadSetting);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_metaclass$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$JailBreakHelper, @selector(getIAPCheckPath), (IMP)&_logos_meta_method$_ungrouped$JailBreakHelper$getIAPCheckPath, (IMP*)&_logos_meta_orig$_ungrouped$JailBreakHelper$getIAPCheckPath);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_metaclass$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$JailBreakHelper, @selector(getJailbreakPath), (IMP)&_logos_meta_method$_ungrouped$JailBreakHelper$getJailbreakPath, (IMP*)&_logos_meta_orig$_ungrouped$JailBreakHelper$getJailbreakPath);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_metaclass$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$JailBreakHelper, @selector(getJailbreakRootDir), (IMP)&_logos_meta_method$_ungrouped$JailBreakHelper$getJailbreakRootDir, (IMP*)&_logos_meta_orig$_ungrouped$JailBreakHelper$getJailbreakRootDir);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_metaclass$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$JailBreakHelper, @selector(initialize), (IMP)&_logos_meta_method$_ungrouped$JailBreakHelper$initialize, (IMP*)&_logos_meta_orig$_ungrouped$JailBreakHelper$initialize);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(onPackageListUpdated:), (IMP)&_logos_method$_ungrouped$JailBreakHelper$onPackageListUpdated$, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$onPackageListUpdated$);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(onPackageDownloadProcessUpdated:downloadSize:totalSize:), (IMP)&_logos_method$_ungrouped$JailBreakHelper$onPackageDownloadProcessUpdated$downloadSize$totalSize$, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$onPackageDownloadProcessUpdated$downloadSize$totalSize$);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(onPackageDownloadFinish:package:), (IMP)&_logos_method$_ungrouped$JailBreakHelper$onPackageDownloadFinish$package$, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$onPackageDownloadFinish$package$);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(save), (IMP)&_logos_method$_ungrouped$JailBreakHelper$save, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$save);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(HasInstallJailbreakPluginInvalidIAPPurchase), (IMP)&_logos_method$_ungrouped$JailBreakHelper$HasInstallJailbreakPluginInvalidIAPPurchase, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$HasInstallJailbreakPluginInvalidIAPPurchase);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(isOverADay), (IMP)&_logos_method$_ungrouped$JailBreakHelper$isOverADay, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$isOverADay);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(HasInstallJailbreakPlugin:), (IMP)&_logos_method$_ungrouped$JailBreakHelper$HasInstallJailbreakPlugin$, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$HasInstallJailbreakPlugin$);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(IsJailBreak), (IMP)&_logos_method$_ungrouped$JailBreakHelper$IsJailBreak, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$IsJailBreak);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(getKeyStr), (IMP)&_logos_method$_ungrouped$JailBreakHelper$getKeyStr, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$getKeyStr);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, @selector(init), (IMP)&_logos_method$_ungrouped$JailBreakHelper$init, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$init);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}if (_logos_class$_ungrouped$JailBreakHelper) {MSHookMessageEx(_logos_class$_ungrouped$JailBreakHelper, sel_registerName("dealloc"), (IMP)&_logos_method$_ungrouped$JailBreakHelper$dealloc, (IMP*)&_logos_orig$_ungrouped$JailBreakHelper$dealloc);} else {HBLogError(@"logos: nil class %s", "JailBreakHelper");}Class _logos_class$_ungrouped$WCPayTouchIDAuthHelper = objc_getClass("WCPayTouchIDAuthHelper"); Class _logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper = object_getClass(_logos_class$_ungrouped$WCPayTouchIDAuthHelper); if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(logAbTestItem:transactionId:event:), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$logAbTestItem$transactionId$event$, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$logAbTestItem$transactionId$event$);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(isDeviceTouchIDAvailableAndNotJailBreak), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailableAndNotJailBreak, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailableAndNotJailBreak);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(isDeviceTouchIDAvailable), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailable, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDAvailable);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(isDeviceTouchIDHardwareSupportedAndNotJailBreak), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupportedAndNotJailBreak, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupportedAndNotJailBreak);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(isDeviceTouchIDHardwareSupported), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupported, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceTouchIDHardwareSupported);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(isDeviceJailBreak), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isDeviceJailBreak, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isDeviceJailBreak);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(isInWhiteList:), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$isInWhiteList$, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$isInWhiteList$);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(canUseTouchIDFromData:), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$canUseTouchIDFromData$, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$canUseTouchIDFromData$);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}if (_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper) {MSHookMessageEx(_logos_metaclass$_ungrouped$WCPayTouchIDAuthHelper, @selector(showTouchIDAuthView:whenSuccess:whenFail:), (IMP)&_logos_meta_method$_ungrouped$WCPayTouchIDAuthHelper$showTouchIDAuthView$whenSuccess$whenFail$, (IMP*)&_logos_meta_orig$_ungrouped$WCPayTouchIDAuthHelper$showTouchIDAuthView$whenSuccess$whenFail$);} else {HBLogError(@"logos: nil class %s", "WCPayTouchIDAuthHelper");}Class _logos_class$_ungrouped$MMUploadFileViewController = objc_getClass("MMUploadFileViewController"); if (_logos_class$_ungrouped$MMUploadFileViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMUploadFileViewController, @selector(isJailbreak), (IMP)&_logos_method$_ungrouped$MMUploadFileViewController$isJailbreak, (IMP*)&_logos_orig$_ungrouped$MMUploadFileViewController$isJailbreak);} else {HBLogError(@"logos: nil class %s", "MMUploadFileViewController");}if (_logos_class$_ungrouped$MMUploadFileViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMUploadFileViewController, @selector(writeMailWithFileInformation:), (IMP)&_logos_method$_ungrouped$MMUploadFileViewController$writeMailWithFileInformation$, (IMP*)&_logos_orig$_ungrouped$MMUploadFileViewController$writeMailWithFileInformation$);} else {HBLogError(@"logos: nil class %s", "MMUploadFileViewController");}Class _logos_class$_ungrouped$MMUploadDataViewController = objc_getClass("MMUploadDataViewController"); if (_logos_class$_ungrouped$MMUploadDataViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMUploadDataViewController, @selector(writeMailWithAttachFile:zipName:zipPath:), (IMP)&_logos_method$_ungrouped$MMUploadDataViewController$writeMailWithAttachFile$zipName$zipPath$, (IMP*)&_logos_orig$_ungrouped$MMUploadDataViewController$writeMailWithAttachFile$zipName$zipPath$);} else {HBLogError(@"logos: nil class %s", "MMUploadDataViewController");}if (_logos_class$_ungrouped$MMUploadDataViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMUploadDataViewController, @selector(isJailbreak), (IMP)&_logos_method$_ungrouped$MMUploadDataViewController$isJailbreak, (IMP*)&_logos_orig$_ungrouped$MMUploadDataViewController$isJailbreak);} else {HBLogError(@"logos: nil class %s", "MMUploadDataViewController");}Class _logos_class$_ungrouped$iAPMgr = objc_getClass("iAPMgr"); if (_logos_class$_ungrouped$iAPMgr) {MSHookMessageEx(_logos_class$_ungrouped$iAPMgr, @selector(cannotPurchaseDuetoJailbreakPlugin:), (IMP)&_logos_method$_ungrouped$iAPMgr$cannotPurchaseDuetoJailbreakPlugin$, (IMP*)&_logos_orig$_ungrouped$iAPMgr$cannotPurchaseDuetoJailbreakPlugin$);} else {HBLogError(@"logos: nil class %s", "iAPMgr");}Class _logos_class$_ungrouped$WtloginPlatformInfo = objc_getClass("WtloginPlatformInfo"); if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(_checkDevice), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$_checkDevice, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$_checkDevice);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(guidForReport), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$guidForReport, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$guidForReport);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(writeSigDataTofile), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$writeSigDataTofile, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$writeSigDataTofile);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(printAllMemsig), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$printAllMemsig, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$printAllMemsig);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(appMainBundleIndentify), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$appMainBundleIndentify, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$appMainBundleIndentify);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(appBundleVersion), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$appBundleVersion, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$appBundleVersion);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(appBundleShortVersionString), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$appBundleShortVersionString, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$appBundleShortVersionString);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(lastLoginAppVer), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$lastLoginAppVer, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginAppVer);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(lastLoginSdkVer), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$lastLoginSdkVer, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginSdkVer);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(lastLoginTime), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$lastLoginTime, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$lastLoginTime);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(resetLastLoginInfo), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$resetLastLoginInfo, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$resetLastLoginInfo);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(sigVailidateBySigType:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$sigVailidateBySigType$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$sigVailidateBySigType$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(setSigVailidateTime:bySigType:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$setSigVailidateTime$bySigType$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$setSigVailidateTime$bySigType$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(clearNameToUin:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$clearNameToUin$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$clearNameToUin$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(setNameToConfig:forUin:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$setNameToConfig$forUin$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$setNameToConfig$forUin$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(clearPwdSigUser:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$clearPwdSigUser$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$clearPwdSigUser$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(pwdSigUser:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$pwdSigUser$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$pwdSigUser$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(setSavePwdSigToConfig:forAccount:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$setSavePwdSigToConfig$forAccount$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$setSavePwdSigToConfig$forAccount$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(resetKeyChain), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$resetKeyChain, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$resetKeyChain);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(ksidForUser:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$ksidForUser$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$ksidForUser$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(setKsidToConfig:forAccount:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$setKsidToConfig$forAccount$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$setKsidToConfig$forAccount$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(setKsidToKeyChain:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$setKsidToKeyChain$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$setKsidToKeyChain$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(ksidFromKeyChain), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$ksidFromKeyChain, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$ksidFromKeyChain);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(tgtgtKeyFromKeyChain), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$tgtgtKeyFromKeyChain, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$tgtgtKeyFromKeyChain);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(crtCarrierName), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$crtCarrierName, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$crtCarrierName);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(netState), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$netState, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$netState);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(setConfigObject:forKey:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$setConfigObject$forKey$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$setConfigObject$forKey$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(configObjectForKey:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$configObjectForKey$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$configObjectForKey$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, sel_registerName("dealloc"), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$dealloc, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$dealloc);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(wtloginPlatformDataInit), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$wtloginPlatformDataInit, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$wtloginPlatformDataInit);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(init), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$init, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$init);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(tryDecrypt:byKey:andOutData:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$tryDecrypt$byKey$andOutData$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$tryDecrypt$byKey$andOutData$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(getDeviceVersion), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$getDeviceVersion, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$getDeviceVersion);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(writeGuidToPasteBoard:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$writeGuidToPasteBoard$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$writeGuidToPasteBoard$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(readGuidArrayFromPasteBoard:), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$readGuidArrayFromPasteBoard$, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$readGuidArrayFromPasteBoard$);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(genGuid), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$genGuid, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$genGuid);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(macaddress), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$macaddress, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$macaddress);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(GetHWAddresses), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$GetHWAddresses, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$GetHWAddresses);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(GetIPAddresses), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$GetIPAddresses, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$GetIPAddresses);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(FreeAddresses), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$FreeAddresses, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$FreeAddresses);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}if (_logos_class$_ungrouped$WtloginPlatformInfo) {MSHookMessageEx(_logos_class$_ungrouped$WtloginPlatformInfo, @selector(InitAddresses), (IMP)&_logos_method$_ungrouped$WtloginPlatformInfo$InitAddresses, (IMP*)&_logos_orig$_ungrouped$WtloginPlatformInfo$InitAddresses);} else {HBLogError(@"logos: nil class %s", "WtloginPlatformInfo");}}
   }
    

}






























