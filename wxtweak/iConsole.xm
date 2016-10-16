#include "wxUtil.h"


%hook iConsole
+ (_Bool)shouldEnableDebugLog {
    return 1;
 }
+ (void)purelog:(id)arg1 { 
%log;
 %orig(arg1);
 }
+ (_Bool)shouldLog:(int)arg1 {
    return 1;
}

+ (void)logToFile:(int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 message:(id)arg6 
{
    WXLog(@"%d-%s-%s-%d-%s-%@", arg1, arg2, arg3, arg4, arg5, arg6);
    
    %orig(arg1, arg2, arg3, arg4, arg5, arg6);
   }
  /*
+ (void)logWithLevel:(int)arg1 module:(const char *)arg2 errorCode:(unsigned int)arg3 file:(const char *)arg4 line:(int)arg5 func:(const char *)arg6 format:(id)arg7 
{
    %log;
    %orig;
 }
+ (void)logWithLevel:(int)arg1 module:(const char *)arg2 errorCode:(unsigned int)arg3 file:(const char *)arg4 line:(int)arg5 func:(const char *)arg6 message:(id)arg7 
{ 
%log; 
%orig;
 }
+ (void)logToConsoleWithColor:(int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 message:(id)arg6 {
 %log;
  %orig; 
  }
+ (void)printLog:(int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 log:(id)arg6 
{ 
%log;
 %orig;
  }
+ (void)purelog:(id)arg1 arguments:(char *)arg2 isCommand:(_Bool)arg3 { 
%log;
 %orig;
  }

+ (void)doWXLog:(id)arg1 { 
%log;
 %orig; 
 }
- (NSString *)debugDescription { 
%log; 
NSString * r = %orig; HBLogDebug(@" = %@", r);
return r; 
}
- (NSString *)description 
{ 
%log; 
NSString * r = %orig;
 HBLogDebug(@" = %@", r); 
 return r; 
 }
 */
%end


%ctor {
    if (checkPluginCanUse()){
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}