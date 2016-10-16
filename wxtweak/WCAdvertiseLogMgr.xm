#include "wxUtil.h"

%hook WCAdvertiseLogMgr
- (unsigned int)getMaxSendSize { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)getRandomInternalTime { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)getExceptionMaxTime { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)saveNextReportTime:(unsigned int)arg1 { %log; %orig; }
- (unsigned int)getNextReportTime { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)onAuthOK { %log; %orig; }
- (void)didEnterBackground { %log; %orig; }
- (void)willEnterForeground { %log; %orig; }
- (void)startReportADLog { %log; WXLog(@"startReportADLog cancel");  }
- (id)getReportADLogPackage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)tryReportADLog { %log; WXLog(@"tryReportADLog cancel"); }
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)insertDBLogsToDb { %log; %orig; }
- (void)reportADLog:(unsigned int)arg1 logExt:(id)arg2 { %log; WXLog(@"reportADLog cancel");  }
- (id)getKVLogHead { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setupLogDB { %log; %orig; }
- (void)onServiceReloadData { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (void)onServiceClearData { %log; %orig; }
- (void)onServiceInit { %log; %orig; }
- (id)getPathForLogCache { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end

%ctor {
    if (checkPluginCanUse()){
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}