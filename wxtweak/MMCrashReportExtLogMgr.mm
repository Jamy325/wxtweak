#line 1 "/Users/jamy/works/wxtweak/wxtweak/MMCrashReportExtLogMgr.xm"

#include "wxUtil.h"


#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

#include <substrate.h>
@class MMCrashReportExtLogMgr; 
static id (*_logos_orig$_ungrouped$MMCrashReportExtLogMgr$getExtLogs)(_LOGOS_SELF_TYPE_NORMAL MMCrashReportExtLogMgr* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$MMCrashReportExtLogMgr$getExtLogs(_LOGOS_SELF_TYPE_NORMAL MMCrashReportExtLogMgr* _LOGOS_SELF_CONST, SEL); static MMCrashReportExtLogMgr* (*_logos_orig$_ungrouped$MMCrashReportExtLogMgr$init)(_LOGOS_SELF_TYPE_INIT MMCrashReportExtLogMgr*, SEL) _LOGOS_RETURN_RETAINED; static MMCrashReportExtLogMgr* _logos_method$_ungrouped$MMCrashReportExtLogMgr$init(_LOGOS_SELF_TYPE_INIT MMCrashReportExtLogMgr*, SEL) _LOGOS_RETURN_RETAINED; 

#line 5 "/Users/jamy/works/wxtweak/wxtweak/MMCrashReportExtLogMgr.xm"


static id _logos_method$_ungrouped$MMCrashReportExtLogMgr$getExtLogs(_LOGOS_SELF_TYPE_NORMAL MMCrashReportExtLogMgr* _LOGOS_SELF_CONST self, SEL _cmd) { 
    HBLogDebug(@"-[<MMCrashReportExtLogMgr: %p> getExtLogs]", self); 
 
  

     return [[NSMutableArray alloc] init];
 }




static MMCrashReportExtLogMgr* _logos_method$_ungrouped$MMCrashReportExtLogMgr$init(_LOGOS_SELF_TYPE_INIT MMCrashReportExtLogMgr* self, SEL _cmd) _LOGOS_RETURN_RETAINED { HBLogDebug(@"-[<MMCrashReportExtLogMgr: %p> init]", self); id r = _logos_orig$_ungrouped$MMCrashReportExtLogMgr$init(self, _cmd); HBLogDebug(@" = %@", r); return r; }



static __attribute__((constructor)) void _logosLocalCtor_e8349e58(int argc, char **argv, char **envp) {
    if (checkPluginCanUse())
    {
        {Class _logos_class$_ungrouped$MMCrashReportExtLogMgr = objc_getClass("MMCrashReportExtLogMgr"); if (_logos_class$_ungrouped$MMCrashReportExtLogMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMCrashReportExtLogMgr, @selector(getExtLogs), (IMP)&_logos_method$_ungrouped$MMCrashReportExtLogMgr$getExtLogs, (IMP*)&_logos_orig$_ungrouped$MMCrashReportExtLogMgr$getExtLogs);} else {HBLogError(@"logos: nil class %s", "MMCrashReportExtLogMgr");}if (_logos_class$_ungrouped$MMCrashReportExtLogMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMCrashReportExtLogMgr, @selector(init), (IMP)&_logos_method$_ungrouped$MMCrashReportExtLogMgr$init, (IMP*)&_logos_orig$_ungrouped$MMCrashReportExtLogMgr$init);} else {HBLogError(@"logos: nil class %s", "MMCrashReportExtLogMgr");}}
    }
    
}
