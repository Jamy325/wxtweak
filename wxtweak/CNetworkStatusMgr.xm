

#include "wxUtil.h"

%hook CNetworkStatusMgr

- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)InternalReportWithGPS:(id)arg1 inScene:(unsigned int)arg2 
{
    %log;
    WXLog(@"cancel InternalReportWithGPS");
    //%orig;
}

- (void)InternalReportNetworkInfo:(id)arg1 
{
        %log;
       // %orig;
}
/*
- (id)MakeSafeReportString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)CheckReportNetworkInfo:(unsigned int)arg1 { %log; %orig; }
- (void)CheckBG2FG { %log; %orig; }
- (void)onAuthOK { %log; %orig; }
- (void)OnNetworkStatusReportWithGPS:(id)arg1 inScene:(unsigned int)arg2 { %log; %orig; }
- (void)SaveReportInfo { %log; %orig; }
- (void)LoadReportInfo { %log; %orig; }
- (void)ReachabilityChange:(unsigned int)arg1 { %log; %orig; }
- (id)GetOOBUrl { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetOOBData { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)doReportIpxx:(id)arg1 { %log; %orig; }
- (void)setReadToGettingData { %log; %orig; }
- (unsigned int)getNetworkStatusType { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)onServiceTerminate { %log; %orig; }
- (void)onServiceEnterBackground { %log; %orig; }
- (void)OnEmoticonDownload:(unsigned int)arg1 { %log; %orig; }
- (void)zeroEmocticonDownloadingStatus { %log; %orig; }
- (void)OnErrorByReceiver:(id)arg1 ErrNo:(int)arg2 { %log; %orig; }
- (void)OnAddMessageByReceiver:(id)arg1 { %log; %orig; }
- (void)MessageReturn:(unsigned int)arg1 MessageInfo:(id)arg2 Event:(unsigned int)arg3 { %log; %orig; }
- (void)onServiceReloadData { %log; %orig; }
- (void)onServiceInit { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)unregExt { %log; %orig; }
- (void)regExt { %log; %orig; }
- (void)unListenMessageId { %log; %orig; }
- (void)initMessageIdToListen { %log; %orig; }
- (void)handleVoiceDowdload:(id)arg1 error:(_Bool)arg2 { %log; %orig; }
- (void)zeroVoiceMsgToDownload { %log; %orig; }
- (void)handleSyncEnd { %log; %orig; }
- (void)handleSyncBegin { %log; %orig; }
- (void)handleNetworkStatusChange:(unsigned int)arg1 { %log; %orig; }
- (void)checkCallStatusChangedExt { %log; %orig; }
- (void)callDisconnectStatusChangedExt { %log; %orig; }
- (void)translateStatus { %log; %orig; }
- (void)translateStatusLongUnConnect { %log; %orig; }
- (void)translateStatusLongConnect { %log; %orig; }
- (_Bool)isDuringSync { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)handleReport:(int)arg1 { %log; %orig; }
- (void)handleReportLongUnConnectCount { %log; %orig; }
- (void)handleReportDisconnected:(int)arg1 { %log; %orig; }
- (void)realCalDisconnected { %log; %orig; }
- (void)handleReportGettingData:(int)arg1 { %log; %orig; }
- (void)doReportNetworkStatus { %log; %orig; }
- (_Bool)AddOplogInternal { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isNeedReport { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)loadNetworkStatusReportArchive { %log; %orig; }
- (struct timeval)getCurTimeVal { %log; struct timeval r = %orig; return r; }
*/
%end




%ctor {
    if (checkPluginCanUse())
    {
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}

