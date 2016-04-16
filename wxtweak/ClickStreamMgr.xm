%hook ClickStreamMgr
- (void)insertWithKey:(id)arg1 Value:(id)arg2 { %log; %orig; }

- (void)clearClickStreamReport { %log; %orig; }

- (id)getClickStreamReport { %log; id r = %orig; HBLogDebug(@"getClickStreamReport = %@", r); return 0; }

- (void)onServiceEnterForeground { %log; %orig; }

- (void)onServiceEnterBackground { %log; %orig; }

- (void)recordPage:(id)arg1 withTime:(long long)arg2 { %log; %orig; }

- (void)checkWriteReportLog { %log; %orig; }

- (void)writeReportLog:(_Bool)arg1 { %log; %orig; }

- (id)genRedunDantReport { %log; id r = %orig; HBLogDebug(@"genRedunDantReport = %@", r); return 0; }

- (void)inActivePage:(id)arg1 { %log; %orig; }

- (void)activePage:(id)arg1 { %log; %orig; }

- (void)onServiceClearData { %log; %orig; }

- (void)onServiceTerminate { %log; %orig; }

- (void)onServiceInit { %log; %orig; }

- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@"debugDescription = %@", [r copy]); return r; }

- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@"debugDescription = %@", [r copy]); return r; }
%end
