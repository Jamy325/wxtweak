%hook CMainControll
- (void)setM_tLastLongConnDisconnect:(NSDate *)m_tLastLongConnDisconnect { %log; %orig; }
- (NSDate *)m_tLastLongConnDisconnect { %log; NSDate * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_tLastNotify:(NSDate *)m_tLastNotify { %log; %orig; }
- (NSDate *)m_tLastNotify { %log; NSDate * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (void)setM_statusMessage:(NSMutableString *)m_statusMessage { %log; %orig; }
- (NSMutableString *)m_statusMessage { %log; NSMutableString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_didTraceRouteFail:(_Bool )m_didTraceRouteFail { %log; %orig; }
- (_Bool )m_didTraceRouteFail { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }

- (void)setM_oLock:(NSRecursiveLock *)m_oLock { %log; %orig; }
- (NSRecursiveLock *)m_oLock { %log; NSRecursiveLock * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsDocPath:(NSString *)m_nsDocPath { %log; %orig; }
- (NSString *)m_nsDocPath { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (void)setM_dtLastGetUpdateInfo:(NSDate *)m_dtLastGetUpdateInfo { %log; %orig; }
- (NSDate *)m_dtLastGetUpdateInfo { %log; NSDate * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (NSDate *)m_dtLastSyncForAuth { %log; NSDate * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_dtLastSyncSend:(NSDate *)m_dtLastSyncSend { %log; %orig; }
- (NSDate *)m_dtLastSyncSend { %log; NSDate * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsVoipSound:(NSString *)m_nsVoipSound { %log; %orig; }
- (NSString *)m_nsVoipSound { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_nsSound:(NSString *)m_nsSound { %log; %orig; }
- (NSString *)m_nsSound { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setM_uiTokenStatus:(unsigned int )m_uiTokenStatus { %log; %orig; }
- (unsigned int )m_uiTokenStatus { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)setM_nsToken:(NSString *)m_nsToken { %log; %orig; }
- (NSString *)m_nsToken { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (void)didTrancerouteEnd { %log; %orig; }
- (void)tracerouteExecutor:(id)arg1 startedPingingWithTTL:(id)arg2 { %log; %orig; }
- (void)tracerouteExecutor:(id)arg1 traceRouteStepDone:(id)arg2 { %log; %orig; }
- (void)tracerouteExecutor:(id)arg1 tracerouteFailed:(id)arg2 { %log; %orig; }
- (void)tracerouteExecutor:(id)arg1 endedTracerouteWithSteps:(id)arg2 { %log; %orig; }
- (void)startTracerouteWithIpAddress:(const char *)arg1 { %log; %orig; }
- (void)ReportApnsSetting:(_Bool)arg1 { %log; %orig; }
- (void)TimerSync { %log; %orig; }
- (void)onLoginOK { %log; %orig; }
- (void)onAuthOK { %log; %orig; }
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)HandleRespForGetUpdateInfo:(id)arg1 { %log; %orig; }
- (void)CheckUpdate:(id)arg1 { %log; %orig; }
- (void)HandleRespForSendToken:(id)arg1 { %log; %orig; }
- (void)CreateSendTokenEventWithScene:(unsigned int)arg1 { %log; %orig; }
- (void)SendToken:(id)arg1 Status:(unsigned int)arg2 Sound:(id)arg3 VoipSound:(id)arg4 { %log; %orig; }
- (void)onKickQuit { %log; %orig; }
- (void)HandleNewSyncPush:(id)arg1 { %log; %orig; }
- (void)HandleSpecialMessage:(id)arg1 { %log; %orig; }
- (void)speedyDispacthMessage:(id)arg1 { %log; %orig; }
- (void)SpeedyNotifyFromEvent:(id)arg1 Message:(unsigned int)arg2 MessageInfo:(id)arg3 { %log; %orig; }
- (void)NotifyFromEvent:(id)arg1 Message:(unsigned int)arg2 MessageInfo:(id)arg3 { %log; %orig; }
- (void)ReachabilityChange:(unsigned int)arg1 { %log; %orig; }
- (void)handleIPXXMessage:(id)arg1 { %log; %orig; }
- (void)RaiseEvent:(unsigned int)arg1 MessageID:(unsigned int)arg2 MessageInfo:(id)arg3 { %log; %orig; }
- (id)GetLocalInfo { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

- (void)GetBottleContact { %log; %orig; }
- (unsigned int)GetNetworkReachabilitySeed { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)CheckVersion { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (_Bool)IsNewUser { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)CheckWhatsnew { %log; %orig; }
- (void)SetShowWhatsnew:(_Bool)arg1 { %log; %orig; }
- (void)CreateSyncTimer { %log; %orig; }
- (void)HandleQQChanged { %log; %orig; }
- (void)CheckResend { %log; %orig; }
- (void)SendMsg:(_Bool)arg1 { %log; %orig; }
- (_Bool)IsInit { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)IsLogIn { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)ReloadData:(_Bool)arg1 { %log; %orig; }
- (void)ReloadServiceData_InMainThread { %log; %orig; }
- (void)ClearData { %log; %orig; }
- (void)TimerCheckEvent { %log; %orig; }
- (void)CheckSyncAddressBook { %log; %orig; }
- (void)HandleAuthAtFirstTime { %log; %orig; }
- (void)StopAllEvent { %log; %orig; }
- (void)Stop { %log; %orig; }

- (unsigned int)Start:(id)arg1
{
    %log;
    unsigned int r = %orig;
    HBLogDebug(@" = %u", r);
    return r;
}

- (void)LoadLastSvrID { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end
