%hook MMDumpReporterMgr

- (void)onUploadResult:(_Bool)arg1 onTag:(id)arg2 { %log; %orig; }

- (void)removeFistTaskData { %log; %orig; }

- (_Bool)addOneTaskData:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }

- (void)uploadDumpOnIPXX:(id)arg1 { %log; %orig; }

- (void)uploadDumpWithDate:(id)arg1 withReprotCntOneTime:(unsigned long long)arg2 { %log; %orig; }

- (void)uploadDumpWithDate:(id)arg1 { %log; %orig; }

- (void)uploadAllDump { %log; %orig; }

- (void)autoUploadDump 
{
    %log;
    NSLog(@"autoUploadDump cancle");
}

- (void)uploadOneTaskData { 
    %log;
    NSLog(@"uploadOneTaskData cancle");
}

- (id)getBackgroundDumpFilePaths { %log; id r = %orig; HBLogDebug(@"getBackgroundDumpFilePaths = %@", r); return r; }

- (id)getDumpFilePaths { %log; id r = %orig; HBLogDebug(@"getDumpFilePaths = %@", r); return r; }

- (id)getCPUDumpFilePaths { %log; id r = %orig; HBLogDebug(@"getCPUDumpFilePaths = %@", r); return r; }

- (_Bool)shouldUpload { %log; _Bool r = %orig; HBLogDebug(@"shouldUpload = %d", r); return r; }

- (void)onEnterBackGround { %log; %orig; }

- (void)onEnterForgeGround { %log; %orig; }

- (_Bool)limitUpload:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@"limitUpload = %d", r); return r; }

- (void)willTerminate { %log; %orig; }

- (id)init { %log; id r = %orig; HBLogDebug(@"MMDumpReporterMgr = %@", r); return r; }

%end
