#line 1 "/Users/jamy/works/wxtweak/wxtweak/iConsole.xm"

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
@class iConsole; 
static _Bool (*_logos_meta_orig$_ungrouped$iConsole$shouldEnableDebugLog)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$iConsole$shouldEnableDebugLog(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$iConsole$purelog$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$iConsole$purelog$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_meta_orig$_ungrouped$iConsole$shouldLog$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, int); static _Bool _logos_meta_method$_ungrouped$iConsole$shouldLog$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, int); static void (*_logos_meta_orig$_ungrouped$iConsole$logToFile$module$file$line$func$message$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, int, const char *, const char *, int, const char *, id); static void _logos_meta_method$_ungrouped$iConsole$logToFile$module$file$line$func$message$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, int, const char *, const char *, int, const char *, id); 

#line 2 "/Users/jamy/works/wxtweak/wxtweak/iConsole.xm"

static _Bool _logos_meta_method$_ungrouped$iConsole$shouldEnableDebugLog(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
    return 1;
 }
static void _logos_meta_method$_ungrouped$iConsole$purelog$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd, id arg1) { 
HBLogDebug(@"+[<iConsole: %p> purelog:%@]", self, arg1);
 _logos_meta_orig$_ungrouped$iConsole$purelog$(self, _cmd, arg1);
 }
static _Bool _logos_meta_method$_ungrouped$iConsole$shouldLog$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd, int arg1) {
    return 1;
}


static void _logos_meta_method$_ungrouped$iConsole$logToFile$module$file$line$func$message$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd, int arg1, const char * arg2, const char * arg3, int arg4, const char * arg5, id arg6)  {
    HBLogDebug(@"+[<iConsole: %p> logToFile:%d module:0x%x file:0x%x line:%d func:0x%x message:%@]", self, arg1, (unsigned int)arg2, (unsigned int)arg3, arg4, (unsigned int)arg5, arg6);
    _logos_meta_orig$_ungrouped$iConsole$logToFile$module$file$line$func$message$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6);
   }
  










































static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$iConsole = objc_getClass("iConsole"); Class _logos_metaclass$_ungrouped$iConsole = object_getClass(_logos_class$_ungrouped$iConsole); if (_logos_metaclass$_ungrouped$iConsole) {MSHookMessageEx(_logos_metaclass$_ungrouped$iConsole, @selector(shouldEnableDebugLog), (IMP)&_logos_meta_method$_ungrouped$iConsole$shouldEnableDebugLog, (IMP*)&_logos_meta_orig$_ungrouped$iConsole$shouldEnableDebugLog);} else {HBLogError(@"logos: nil class %s", "iConsole");}if (_logos_metaclass$_ungrouped$iConsole) {MSHookMessageEx(_logos_metaclass$_ungrouped$iConsole, @selector(purelog:), (IMP)&_logos_meta_method$_ungrouped$iConsole$purelog$, (IMP*)&_logos_meta_orig$_ungrouped$iConsole$purelog$);} else {HBLogError(@"logos: nil class %s", "iConsole");}if (_logos_metaclass$_ungrouped$iConsole) {MSHookMessageEx(_logos_metaclass$_ungrouped$iConsole, @selector(shouldLog:), (IMP)&_logos_meta_method$_ungrouped$iConsole$shouldLog$, (IMP*)&_logos_meta_orig$_ungrouped$iConsole$shouldLog$);} else {HBLogError(@"logos: nil class %s", "iConsole");}if (_logos_metaclass$_ungrouped$iConsole) {MSHookMessageEx(_logos_metaclass$_ungrouped$iConsole, @selector(logToFile:module:file:line:func:message:), (IMP)&_logos_meta_method$_ungrouped$iConsole$logToFile$module$file$line$func$message$, (IMP*)&_logos_meta_orig$_ungrouped$iConsole$logToFile$module$file$line$func$message$);} else {HBLogError(@"logos: nil class %s", "iConsole");}} }
#line 62 "/Users/jamy/works/wxtweak/wxtweak/iConsole.xm"
