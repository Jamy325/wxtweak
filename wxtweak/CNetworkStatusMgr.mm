#line 1 "/Users/jamy/works/wxtweak/wxtweak/CNetworkStatusMgr.xm"


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
@class CNetworkStatusMgr; 
static void (*_logos_orig$_ungrouped$CNetworkStatusMgr$MessageReturn$Event$)(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST, SEL, id, unsigned int); static void _logos_method$_ungrouped$CNetworkStatusMgr$MessageReturn$Event$(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST, SEL, id, unsigned int); static void (*_logos_orig$_ungrouped$CNetworkStatusMgr$InternalReportWithGPS$inScene$)(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST, SEL, id, unsigned int); static void _logos_method$_ungrouped$CNetworkStatusMgr$InternalReportWithGPS$inScene$(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST, SEL, id, unsigned int); static void (*_logos_orig$_ungrouped$CNetworkStatusMgr$InternalReportNetworkInfo$)(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$CNetworkStatusMgr$InternalReportNetworkInfo$(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST, SEL, id); 

#line 5 "/Users/jamy/works/wxtweak/wxtweak/CNetworkStatusMgr.xm"


static void _logos_method$_ungrouped$CNetworkStatusMgr$MessageReturn$Event$(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, unsigned int arg2) { HBLogDebug(@"-[<CNetworkStatusMgr: %p> MessageReturn:%@ Event:%u]", self, arg1, arg2); _logos_orig$_ungrouped$CNetworkStatusMgr$MessageReturn$Event$(self, _cmd, arg1, arg2); }

static void _logos_method$_ungrouped$CNetworkStatusMgr$InternalReportWithGPS$inScene$(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, unsigned int arg2)  {
    HBLogDebug(@"-[<CNetworkStatusMgr: %p> InternalReportWithGPS:%@ inScene:%u]", self, arg1, arg2);
    WXLog(@"cancel InternalReportWithGPS");
    
}


static void _logos_method$_ungrouped$CNetworkStatusMgr$InternalReportNetworkInfo$(_LOGOS_SELF_TYPE_NORMAL CNetworkStatusMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1)  {
        HBLogDebug(@"-[<CNetworkStatusMgr: %p> InternalReportNetworkInfo:%@]", self, arg1);
       
}
























































static __attribute__((constructor)) void _logosLocalCtor_72aaf43c(int argc, char **argv, char **envp) {
    if (checkPluginCanUse())
    {
        {Class _logos_class$_ungrouped$CNetworkStatusMgr = objc_getClass("CNetworkStatusMgr"); if (_logos_class$_ungrouped$CNetworkStatusMgr) {MSHookMessageEx(_logos_class$_ungrouped$CNetworkStatusMgr, @selector(MessageReturn:Event:), (IMP)&_logos_method$_ungrouped$CNetworkStatusMgr$MessageReturn$Event$, (IMP*)&_logos_orig$_ungrouped$CNetworkStatusMgr$MessageReturn$Event$);} else {HBLogError(@"logos: nil class %s", "CNetworkStatusMgr");}if (_logos_class$_ungrouped$CNetworkStatusMgr) {MSHookMessageEx(_logos_class$_ungrouped$CNetworkStatusMgr, @selector(InternalReportWithGPS:inScene:), (IMP)&_logos_method$_ungrouped$CNetworkStatusMgr$InternalReportWithGPS$inScene$, (IMP*)&_logos_orig$_ungrouped$CNetworkStatusMgr$InternalReportWithGPS$inScene$);} else {HBLogError(@"logos: nil class %s", "CNetworkStatusMgr");}if (_logos_class$_ungrouped$CNetworkStatusMgr) {MSHookMessageEx(_logos_class$_ungrouped$CNetworkStatusMgr, @selector(InternalReportNetworkInfo:), (IMP)&_logos_method$_ungrouped$CNetworkStatusMgr$InternalReportNetworkInfo$, (IMP*)&_logos_orig$_ungrouped$CNetworkStatusMgr$InternalReportNetworkInfo$);} else {HBLogError(@"logos: nil class %s", "CNetworkStatusMgr");}}
    }
    
}

