
#include "wxUtil.h"


%hook MMPerformanceDataReportMgr
+ (id)shareInstance { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)onPackageDownloadFinish:(id)arg1 package:(id)arg2 { %log; %orig; }
- (void)onPackageListUpdated:(id)arg1 { %log; %orig; }
- (void)onReceiveConfig:(id)arg1 { %log; %orig; }
- (void)downloadPackage:(id)arg1 { %log; %orig; }
- (void)onAuthOK { %log; %orig; }
- (void)updatePackageVersion:(int)arg1 { %log; %orig; }
- (int)getCurrentPackageVersion { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getPackageVersionFile { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getXmlFilePath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)loadIdKeyInfo { %log; %orig; }
- (void)getKeyInfo:(struct XmlReaderNode_t *)arg1 { %log; %orig; }
- (id)getReportIdKeyEx:(struct XmlReaderNode_t *)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)reportCostData:(unsigned int)arg1 ToIdKey:(unsigned int)arg2 ToMainKey:(unsigned int)arg3 ToKeyRange:(id)arg4 ToRange:(id)arg5
{
    %log;
    %orig;
}
- (void)reportCostData:(unsigned int)arg1 ToIdKey:(unsigned int)arg2 ToKeyRange:(id)arg3 ToRange:(id)arg4 { %log; %orig; }
- (void)reportCostData:(unsigned int)arg1 ToCaseId:(unsigned long long)arg2 { %log; %orig; }
- (void)reportCostMemoryToIdKey:(unsigned int)arg1 caseID:(unsigned long long)arg2 { %log; %orig; }
- (void)reportCostTimeToIdKey:(unsigned int)arg1 caseID:(unsigned long long)arg2 { %log; %orig; }
- (void)reportCostMemoryOnKey:(id)arg1 { %log; %orig; }
- (void)reportCostTimeOnKey:(id)arg1 { %log; %orig; }
- (void)setCurrentMemoryOnCase:(unsigned long long)arg1 withTag:(id)arg2 { %log; %orig; }
- (void)setCurrentTimeOnCase:(unsigned long long)arg1 withTag:(id)arg2 { %log; %orig; }
- (void)endLogPerformanceData:(unsigned long long)arg1 onCase:(unsigned long long)arg2 withTag:(id)arg3 { %log; %orig; }
- (void)startLogPerformanceData:(unsigned long long)arg1 onCase:(unsigned long long)arg2 withTag:(id)arg3 { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (void)registerExtension { %log; %orig; }
- (void)start { %log; %orig; }
- (void)stop { %log; %orig; }
- (void)didBecomeActive { %log; %orig; }
- (void)willSuspend { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

%end

%ctor {
    if (checkPluginCanUse())
    {
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}
