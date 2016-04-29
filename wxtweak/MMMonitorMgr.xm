#include "wxUtil.h"

%hook MMMonitorMgr
- (void)reportDataWithBlockTime:(unsigned long long)arg1 
{
 %log; 
 %orig;
  }

- (void)threadProc { %log; %orig; }
- (void)dump:(long long)arg1 { 
    %log;
    NSLog(@"MMMonitorMgr dump cancel");
 }
- (_Bool)needFilter { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (long long)check { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (unsigned long long)diffTime:(struct timeval *)arg1 endTime:(struct timeval *)arg2 { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (void)logFPS { %log; %orig; }
- (void)onDisplay:(id)arg1 { %log; %orig; }
- (void)addFPSMonitor { %log; %orig; }
- (void)addMonitorThread { %log; %orig; }
- (void)removeRunLoopObserver { %log; %orig; }
- (void)addRunLoopObserver { %log; %orig; }
- (void)didEnterBackground { %log; %orig; }
- (void)didBecomeActive { %log; %orig; }
- (void)willSuspend { %log; %orig; }
- (void)willTerminate { %log; %orig; }
- (void)stop { %log; %orig; }

- (id)init {
    %log;
    id r = %orig; HBLogDebug(@" = %@", r);
    return r;
}
%end


%ctor {
    if (checkPluginCanUse()){
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}