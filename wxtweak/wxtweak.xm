
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

//#error iOSOpenDev post-project creation from template requirements (remove these lines after completed) -- \
//	Link to libsubstrate.dylib: \
//	(1) go to TARGETS > Build Phases > Link Binary With Libraries and add /opt/iOSOpenDev/lib/libsubstrate.dylib \
//	(2) remove these lines from *.xm files (not *.mm files as they're automatically generated from *.xm files)


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
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
}


void UncaughtExceptionHandler(NSException* exception)
{
    NSString* name = [ exception name ];
    NSString* reason = [ exception reason ];
    NSArray* symbols = [ exception callStackSymbols ]; // 异常发生时的调用栈
    NSMutableString* strSymbols = [ [ NSMutableString alloc ] init ]; //将调用栈拼成输出日志的字符串
    for ( NSString* item in symbols )
    {
        [ strSymbols appendString: item ];
        [ strSymbols appendString: @"\r\n" ];
    }
    
    //将crash日志保存到Document目录下的Log文件夹下
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *logDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
  //  NSString* bid = [[NSBundle mainBundle] bundleIdentifier];
  //  NSString *logDirectory = [NSString stringWithFormat:@"/private/var/mobile/Media/TouchSprite/log/%@", bid];
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
    //把错误日志写到文件中
    if (![fileManager fileExistsAtPath:logFilePath]) {
        [crashString writeToFile:logFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }else{
        NSFileHandle *outFile = [NSFileHandle fileHandleForWritingAtPath:logFilePath];
        [outFile seekToEndOfFile];
        [outFile writeData:[crashString dataUsingEncoding:NSUTF8StringEncoding]];
        [outFile closeFile];
    }
    
    //把错误日志发送到邮箱
    //    NSString *urlStr = [NSString stringWithFormat:@"mailto://test@163.com?subject=bug报告&body=感谢您的配合!<br><br><br>错误详情:<br>%@",crashString ];
    //    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    //    [[UIApplication sharedApplication] openURL:url];
}


void redirectWXLogToDocumentFolder()
{
    //如果已经连接Xcode调试则不输出到文件
    if(isatty(STDOUT_FILENO)) {
        return;
    }
    
    UIDevice *device = [UIDevice currentDevice];
    if([[device model] hasSuffix:@"Simulator"]){ //在模拟器不保存到文件中
        return;
    }
    
    //将WXLog打印信息保存到Document目录下的Log文件夹下
      NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *logDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
    
    //NSString* bid = [[NSBundle mainBundle] bundleIdentifier];
 //   NSString* str = [bid stringByReplacingOccurrenceOfString:@"." withString:@"_"];
  //  NSString *logDirectory =@"/private/var/mobile/Media/TouchSprite/log/wx";
    //[NSString stringWithFormat:@"/private/var/mobile/Media/TouchSprite/log/wx/", str];
    
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
    [formatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"]; //每次启动后都保存一个新的日志文件中
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    NSString *logFilePath = [logDirectory stringByAppendingFormat:@"/%@.log",dateStr];
    
    
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    
  //  freopen("/dev/null", "a+", stdout);
  //  freopen("/dev/null", "a+", stderr);
    
    
    //未捕获的Objective-C异常日志
    NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
}



bool checkPluginCanUse()
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *tmpdir = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"/Log/config.dat"];
    BOOL fileExists = [fileManager fileExistsAtPath:tmpdir];
   WXLog(@"=========================file is exist:%@ %d", tmpdir, fileExists);
    //检查目录是否存在，不存在则认为不合法
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
    
  //  WXLog(@"key:%@, 1:%@,2%@, reslut:%@", key, md51, md52, result);
    
    if ([md52 isEqualToString:result]){
     //   WXLog(@"---------yes success");
        return true;
    }
   // WXLog(@"---------can not use");
  // return pwd && [pwd length] > 0;
    return false;
}


%hook ClientCheckMgr

+ (id)sharedInstance
{
	%log;

	return %orig;
}

- (void)checkHook:(id)originalArgument
{
	%log;
    return;
	//%orig(originalArgument);
	
	// or, for exmaple, you could use a custom value instead of the original argument: %orig(customValue);
}

- (id)runningProcesses
{
	%log;

	id originalReturnOfMessage = %orig;
	
	// for example, you could modify the original return value before returning it: [SomeOtherClass doSomethingToThisObject:originalReturnOfMessage];
    WXLog(@"runningProcesses result:%@", originalReturnOfMessage);

	return originalReturnOfMessage;
}

- (void)checkConsistency:(id)arg1
{
    %log;
    return;
}

- (void)reportAppList:(id)arg1
{
    %log;
    return;
}

- (void)reportFileConsistency:(id)arg1 fileName:(id)arg2 offset:(unsigned int)arg3 bufferSize:(unsigned int)arg4 seq:(unsigned int)arg5
{
    %log;
    return;
}

%end



%hook JailBreakHelper
+ (id)loadSetting
{
      %log;
    return nil;
}
+ (id)getIAPCheckPath
{
      %log;
    return @"";
}
+ (id)getJailbreakPath
{
    %log;
    return @"";
}
+ (id)getJailbreakRootDir
{
    %log;
    return @"";
}
+ (void)initialize
{
    %log;
    return;
}

- (void)onPackageListUpdated:(id)arg1
{
    %log;
    return;
}

- (void)onPackageDownloadProcessUpdated:(id)arg1 downloadSize:(int)arg2 totalSize:(int)arg3
{
    %log;
    return %orig;
}

- (void)onPackageDownloadFinish:(id)arg1 package:(id)arg2
{
    %log;
    return %orig;
}

- (_Bool)save
{
    %log;
    return YES;
}

- (_Bool)HasInstallJailbreakPluginInvalidIAPPurchase
{
    %log;
    return NO;
}

- (_Bool)isOverADay
{
    %log;
    return NO;
}

- (_Bool)HasInstallJailbreakPlugin:(id)arg1
{
    %log;
    return NO;
}
- (_Bool)IsJailBreak
{
    %log;
    return NO;
}
- (id)getKeyStr
{
    %log;
    return @"";
}
- (id)init
{
    %log;
    return 0;
}
- (void)dealloc{
    %log;
    return;
}
%end




%hook WCPayTouchIDAuthHelper

+ (void)logAbTestItem:(id)arg1 transactionId:(id)arg2 event:(int)arg3
{
    %log;
    %orig;
}

+ (_Bool)isDeviceTouchIDAvailableAndNotJailBreak
{
    %log;
    return YES;
}
+ (_Bool)isDeviceTouchIDAvailable
{
    %log;
    return NO;
}
+ (_Bool)isDeviceTouchIDHardwareSupportedAndNotJailBreak
{
    %log;
    return NO;
}
+ (_Bool)isDeviceTouchIDHardwareSupported
{
    %log;
    return NO;
}

+ (_Bool)isDeviceJailBreak
{
    %log;
    return NO;
}

+ (_Bool)isInWhiteList:(id)arg1
{
    %log;
    return YES;
}

+ (_Bool)canUseTouchIDFromData:(id)arg1
{
    %log;
    return %orig(arg1);

}

+ (void)showTouchIDAuthView:(id)arg1 whenSuccess:(id)arg2 whenFail:(id)arg3
{
    %log;
    return %orig(arg1, arg2, arg3);

}

%end



%hook MMUploadFileViewController
- (_Bool)isJailbreak
{
    %log;
    return NO;
}

- (void)writeMailWithFileInformation:(id)arg1
{
    %log;
    return;
}

%end


%hook MMUploadDataViewController
- (void)writeMailWithAttachFile:(id)arg1 zipName:(id)arg2 zipPath:(id)arg3
{
    %log;
    return;
}
- (_Bool)isJailbreak
{
    %log;
    return NO;
}

%end



%hook iAPMgr
- (_Bool)cannotPurchaseDuetoJailbreakPlugin:(_Bool)arg1
{
    %log;
    return YES;
}


%end







%hook  WtloginPlatformInfo
-(void)_checkDevice
{
    HBLogInfo(@"_checkDevice cancel");
}

- (id)guidForReport
{
    id r = %orig;
    HBLogInfo(@"%@", r);
    return r;
}

- (void)writeSigDataTofile
{
    return %orig;
}

- (void)printAllMemsig
{
    return %orig;
}

- (id)appMainBundleIndentify
{
    NSString* str = %orig;
    WXLog(@"appMainBundleIndentify:%@ change to com.tencent.xin", str);
    return @"com.tencent.xin";
}
- (id)appBundleVersion
{
    id r = %orig;
    HBLogInfo(@"%@", r);
    return r;
}

- (id)appBundleShortVersionString
{
    id r = %orig;
    HBLogInfo(@"%@", r);
    return r;
}

- (id)lastLoginAppVer
{
    id r = %orig;
    HBLogInfo(@"%@", r);
    return r;
}

- (id)lastLoginSdkVer
{
    id r = %orig;
    HBLogInfo(@"%@", r);
    return r;
}
- (unsigned int)lastLoginTime
{
    int r = %orig;
    HBLogInfo(@"%d", r);
    return r;
}
- (_Bool)resetLastLoginInfo
{
    _Bool r = %orig;
    HBLogInfo(@"%d", r);
    return r;
}

- (unsigned int)sigVailidateBySigType:(unsigned int)arg1
{
    _Bool r = %orig(arg1);
    HBLogInfo(@"arg1:%d,ret:%d", arg1, r);
    return r;
}

- (_Bool)setSigVailidateTime:(unsigned int)arg1 bySigType:(unsigned int)arg2
{
    _Bool r = %orig(arg1, arg2);
    HBLogInfo(@"arg1:%d, arg2:%d,ret:%d", arg1, arg2, r);
    return r;
}

- (void)clearNameToUin:(id)arg1
{
    %orig(arg1);
    HBLogInfo(@"arg1:%@", arg1);
   // return r;
}

- (_Bool)setNameToConfig:(id)arg1 forUin:(unsigned int)arg2
{
    _Bool r = %orig(arg1, arg2);
    HBLogInfo(@"arg1:%@, arg2:%d,ret:%d", arg1, arg2, r);
    return r;
}

- (void)clearPwdSigUser:(unsigned int)arg1
{
    %orig(arg1);
    HBLogInfo(@"arg1:%d", arg1);
}


- (id)pwdSigUser:(unsigned int)arg1
{
    id r = %orig(arg1);
    HBLogInfo(@"arg1:%d,ret:%@", arg1, r);
    return r;
}


- (_Bool)setSavePwdSigToConfig:(id)arg1 forAccount:(unsigned int)arg2
{
    _Bool r = %orig(arg1, arg2);
    HBLogInfo(@"arg1:%@, arg2:%d,ret:%d", arg1, arg2, r);
    return r;
}


- (void)resetKeyChain
{
    HBLogInfo(@"resetkeychain");
}

- (id)ksidForUser:(id)arg1
{
    id r = %orig(arg1);
    HBLogInfo(@"arg1:%@,ret:%@", arg1, r);
    return r;
}


- (_Bool)setKsidToConfig:(id)arg1 forAccount:(id)arg2
{
    _Bool r = %orig(arg1, arg2);
    HBLogInfo(@"arg1:%@, arg2:%@,ret:%d", arg1, arg2, r);
    return r;
}

- (_Bool)setKsidToKeyChain:(id)arg1
{
    _Bool r = %orig(arg1);
    HBLogInfo(@"arg1:%@,ret:%d", arg1, r);
    return r;
}


- (id)ksidFromKeyChain
{
    id r = %orig;
    HBLogInfo(@"ret:%@", r);
    return r;
}

- (id)tgtgtKeyFromKeyChain
{
    id r = %orig;
    HBLogInfo(@"ret:%@", r);
    return r;
}


- (id)crtCarrierName
{
    id r = %orig;
    HBLogInfo(@"ret:%@", r);
    return r;
}

- (int)netState
{
    int r = %orig;
    HBLogInfo(@"ret:%d", r);
    return r;
}


- (void)setConfigObject:(id)arg1 forKey:(id)arg2
{
    %orig(arg1, arg2);
    HBLogInfo(@"arg1:%@, arg2:%@", arg1, arg2);
}


- (id)configObjectForKey:(id)arg1
{
    id r = %orig;
    HBLogInfo(@" arg1:%@, ret:%@", arg1, r);
    return r;
}


- (void)dealloc
{
    %log;
    return %orig;
}



- (void)wtloginPlatformDataInit
{
    %log;
    return %orig;
}
- (id)init
{
    %log;
    return %orig;
}
- (_Bool)tryDecrypt:(id)arg1 byKey:(id)arg2 andOutData:(id)arg3
{
    %log;
    return %orig(arg1, arg2, arg3);
}

- (id)getDeviceVersion
{
    WXLog(@"getDeviceVersion %@ change to 9.3.1", %orig);
    return @"9.3.1";
}


- (int)writeGuidToPasteBoard:(id)arg1
{
    int r = %orig(arg1);
    HBLogInfo(@"arg1:%@, ret:%d", arg1, r);
    return r;
}

- (int)readGuidArrayFromPasteBoard:(id)arg1
{
    int r = %orig(arg1);
    HBLogInfo(@"arg1:%@, ret:%d", arg1, r);
    return r;
}

- (void)genGuid
{
    HBLogInfo(@" call");
    return %orig;
}


- (id)macaddress
{
    WXLog(@"macaddress %@ change 02:00:00:00:00", %orig);
    return @"02:00:00:00:00:00";
}

- (void)GetHWAddresses
{
    WXLog(@"GetHWAddresses cancel");
    return;
}

- (void)GetIPAddresses
{
    WXLog(@"GetIPAddresses cancel");
    return %orig;
}

- (void)FreeAddresses
{
    WXLog(@"FreeAddresses cancel");
    return;
}

- (void)InitAddresses
{
    %log;
    return %orig;
}
%end


%group AWAYS_CREATE
%hook MicroMessengerAppDelegate
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2
{
    %log;
    _Bool r = %orig(arg1, arg2);
    
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

%end


%hook NSBundle
- (NSString *)bundleIdentifier
{
    %log;
  //  LOGSTACK();
    NSArray* symbos = [NSThread callStackSymbols];
    
    NSRange range = [[symbos objectAtIndex:1] rangeOfString:@"1   WeChat"];
    
    NSString* old = %orig;
    
    if (range.location != NSNotFound){
        WXLog(@"orgin:%@,change to:com.tencent.xin", old);
        return @"com.tencent.xin";
    }
    
     WXLog(@"bundle id :%@", old);
    return old;
}
%end
%end


%ctor {
    %init(AWAYS_CREATE)
    
   if (checkPluginCanUse()){
     %init;
   }
    
//    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}






























