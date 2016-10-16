
#include "wxUtil.h"


%hook MMCrashReportExtLogMgr

- (id)getExtLogs { 
    %log; 
 //   id r = %orig;
  //  HBLogDebug(@" = %@", r);

     return [[NSMutableArray alloc] init];
 }

//- (id)formateLog:(const char *)arg1 withLogInfo:(struct XLoggerInfo_t)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)onClickStream { %log; %orig; }
//- (void)addLogInfo:(struct XLoggerInfo_t)arg1 withMessage:(const char *)arg2 { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end


%ctor {
    if (checkPluginCanUse())
    {
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}
