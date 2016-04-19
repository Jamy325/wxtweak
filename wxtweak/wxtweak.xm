
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

//#error iOSOpenDev post-project creation from template requirements (remove these lines after completed) -- \
//	Link to libsubstrate.dylib: \
//	(1) go to TARGETS > Build Phases > Link Binary With Libraries and add /opt/iOSOpenDev/lib/libsubstrate.dylib \
//	(2) remove these lines from *.xm files (not *.mm files as they're automatically generated from *.xm files)


#include "wxUtil.h"


NSString* md5HexDigest(NSString* input)
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%x", result[i]];
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


void redirectNSLogToDocumentFolder()
{
    //如果已经连接Xcode调试则不输出到文件
    if(isatty(STDOUT_FILENO)) {
        return;
    }
    
    UIDevice *device = [UIDevice currentDevice];
    if([[device model] hasSuffix:@"Simulator"]){ //在模拟器不保存到文件中
        return;
    }
    
    //将NSlog打印信息保存到Document目录下的Log文件夹下
      NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *logDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
    
    //NSString* bid = [[NSBundle mainBundle] bundleIdentifier];
   // NSString *logDirectory = [NSString stringWithFormat:@"/private/var/mobile/Media/TouchSprite/log/%@", bid];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL fileExists = [fileManager fileExistsAtPath:logDirectory];
    if (!fileExists) {
		[fileManager createDirectoryAtPath:logDirectory  withIntermediateDirectories:YES attributes:nil error:nil];
	}
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //每次启动后都保存一个新的日志文件中
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    NSString *logFilePath = [logDirectory stringByAppendingFormat:@"/%@.log",dateStr];
    
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    
    //未捕获的Objective-C异常日志
    NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
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
    NSLog(@"runningProcesses result:%@", originalReturnOfMessage);

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
    %log;
    return %orig;
}

- (id)guidForReport
{
    %log;
    return %orig;
}

- (void)writeSigDataTofile
{
    %log;
    return %orig;
}

- (void)printAllMemsig
{
    %log;
    return %orig;
}

- (id)appMainBundleIndentify
{
    %log;
    NSString* str = %orig;
    NSLog(@"main bundle:%@", str);
    return @"com.tencent.xin";
}
- (id)appBundleVersion
{
    %log;
    return %orig;
}

- (id)appBundleShortVersionString
{
    %log;
    return %orig;
}

- (id)lastLoginAppVer
{
    %log;
    return %orig;
}

- (id)lastLoginSdkVer
{
    %log;
    return %orig;
}
- (unsigned int)lastLoginTime
{
    %log;
    return %orig;
}
- (_Bool)resetLastLoginInfo
{
    %log;
    return %orig;
}

- (unsigned int)sigVailidateBySigType:(unsigned int)arg1
{
    %log;
    return %orig(arg1);
}

- (_Bool)setSigVailidateTime:(unsigned int)arg1 bySigType:(unsigned int)arg2
{
    %log;
    return %orig(arg1, arg2);
}

- (void)clearNameToUin:(id)arg1
{
    %log;
    return %orig(arg1);
}

- (_Bool)setNameToConfig:(id)arg1 forUin:(unsigned int)arg2
{
    %log;
    return %orig(arg1, arg2);
}

- (void)clearPwdSigUser:(unsigned int)arg1
{
    %log;
    return %orig(arg1);
}


- (id)pwdSigUser:(unsigned int)arg1
{
    %log;
    return %orig(arg1);
}


- (_Bool)setSavePwdSigToConfig:(id)arg1 forAccount:(unsigned int)arg2
{
    %log;
    return %orig(arg1, arg2);
}


- (void)resetKeyChain
{
    %log;
    return %orig;
}

- (id)ksidForUser:(id)arg1
{
    %log;
    return %orig(arg1);
}


- (_Bool)setKsidToConfig:(id)arg1 forAccount:(id)arg2
{
    %log;
    return %orig(arg1, arg2);
}

- (_Bool)setKsidToKeyChain:(id)arg1
{
    %log;
    return %orig(arg1);
}


- (id)ksidFromKeyChain
{
    %log;
    return %orig;
}

- (id)tgtgtKeyFromKeyChain
{
    %log;
    return %orig;
}


- (id)crtCarrierName
{
    %log;
    return %orig;
}

- (int)netState
{
    %log;
    return %orig;
}


- (void)setConfigObject:(id)arg1 forKey:(id)arg2
{
    %log;
    return %orig(arg1, arg2);
}


- (id)configObjectForKey:(id)arg1
{
    %log;
    return %orig(arg1);
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
    %log;
    return %orig;
}


- (int)writeGuidToPasteBoard:(id)arg1
{
    %log;
    return %orig(arg1);
}

- (int)readGuidArrayFromPasteBoard:(id)arg1
{
    %log;
    return %orig(arg1);
}

- (void)genGuid
{
    %log;
    return %orig;
}


- (id)macaddress
{
    %log;
    return %orig;
}

- (void)GetHWAddresses
{
    %log;
    return %orig;
}

- (void)GetIPAddresses
{
    %log;
    return %orig;
}

- (void)FreeAddresses
{
    %log;
    return %orig;
}

- (void)InitAddresses
{
    %log;
    return %orig;
}
%end



%hook  MicroMessengerAppDelegate

- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2
{
    %log;
    _Bool r = %orig(arg1, arg2);
    redirectNSLogToDocumentFolder();
    
    return r;
}

%end


%hook NSBundle
- (NSString *)bundleIdentifier
{
    %log;
    LOGSTACK();
    NSArray* symbos = [NSThread callStackSymbols];
    
    NSRange range = [[symbos objectAtIndex:1] rangeOfString:@"1   WeChat"];
    
    NSString* old = %orig;
    
    if (range.location != NSNotFound){
        NSLog(@"orgin:%@,change to:com.tencent.xin", old);
        return @"com.tencent.xin";
    }
    
     NSLog(@"bundle id :%@", old);
    return old;
}
%end































