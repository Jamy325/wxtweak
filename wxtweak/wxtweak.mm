#line 1 "/Users/jamy/works/wxtweak/wxtweak/wxtweak.xm"









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
@class ClientCheckMgr; 
static id (*_logos_meta_orig$_ungrouped$ClientCheckMgr$sharedInstance)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$ClientCheckMgr$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ClientCheckMgr$checkHook$)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClientCheckMgr$checkHook$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$ClientCheckMgr$runningProcesses)(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$ClientCheckMgr$runningProcesses(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST, SEL); 

#line 10 "/Users/jamy/works/wxtweak/wxtweak/wxtweak.xm"



static id _logos_meta_method$_ungrouped$ClientCheckMgr$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
	HBLogDebug(@"+[<ClientCheckMgr: %p> sharedInstance]", self);

	return _logos_meta_orig$_ungrouped$ClientCheckMgr$sharedInstance(self, _cmd);
}


static void _logos_method$_ungrouped$ClientCheckMgr$checkHook$(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST self, SEL _cmd, id originalArgument) {
	
    return;
	
	
	
}


static id _logos_method$_ungrouped$ClientCheckMgr$runningProcesses(_LOGOS_SELF_TYPE_NORMAL ClientCheckMgr* _LOGOS_SELF_CONST self, SEL _cmd) {
	HBLogDebug(@"-[<ClientCheckMgr: %p> runningProcesses]", self);

	id originalReturnOfMessage = _logos_orig$_ungrouped$ClientCheckMgr$runningProcesses(self, _cmd);
	
	
    NSLog(@"runningProcesses result:%@", originalReturnOfMessage);

	return originalReturnOfMessage;
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$ClientCheckMgr = objc_getClass("ClientCheckMgr"); Class _logos_metaclass$_ungrouped$ClientCheckMgr = object_getClass(_logos_class$_ungrouped$ClientCheckMgr); if (_logos_metaclass$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_metaclass$_ungrouped$ClientCheckMgr, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$ClientCheckMgr$sharedInstance, (IMP*)&_logos_meta_orig$_ungrouped$ClientCheckMgr$sharedInstance);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}if (_logos_class$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(checkHook:), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$checkHook$, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$checkHook$);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}if (_logos_class$_ungrouped$ClientCheckMgr) {MSHookMessageEx(_logos_class$_ungrouped$ClientCheckMgr, @selector(runningProcesses), (IMP)&_logos_method$_ungrouped$ClientCheckMgr$runningProcesses, (IMP*)&_logos_orig$_ungrouped$ClientCheckMgr$runningProcesses);} else {HBLogError(@"logos: nil class %s", "ClientCheckMgr");}} }
#line 41 "/Users/jamy/works/wxtweak/wxtweak/wxtweak.xm"
