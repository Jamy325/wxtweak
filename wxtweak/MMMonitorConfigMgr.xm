%hook MMMonitorConfigMgr

- (void)onReceiveStrategy:(int)arg1 withContene:(id)arg2 { %log; %orig; }
- (void)saveIsMonitorState:(_Bool)arg1 { %log; %orig; }
- (_Bool)saveAlreadyUploadCnt:(unsigned long long)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (unsigned long long)getAlreadyUploadCnt { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (unsigned long long)getReportEnv { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (unsigned long long)getOneTimeUpload { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (unsigned long long)getMaxDailyReport { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (_Bool)getIsAutoReport { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }
- (_Bool)getIsMonitor { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }
- (_Bool)isIPXXExpired { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)onStategy:(id)arg1 { %log; %orig; }
- (void)onIPXX:(id)arg1 { %log; %orig; }
- (void)onIPXXReportBlockDump:(id)arg1 { %log; %orig; }
- (void)onIPXXStrategy:(id)arg1 { %log; %orig; }
- (_Bool)parseCommonNode:(struct XmlReaderNode_t *)arg1 toConfig:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getConfigFilePath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)saveDumpReportConfig { %log; %orig; }
- (_Bool)updateAlreadyUploadCnt { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)loadConfig { %log; %orig; }
- (void)onTimeCheck { %log; %orig; }
- (void)onServiceInit { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end
