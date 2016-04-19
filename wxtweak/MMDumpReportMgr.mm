#line 1 "/Users/jamy/works/wxtweak/wxtweak/MMDumpReportMgr.xm"
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
@class MMDumpReporterMgr; 
static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$onUploadResult$onTag$)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, _Bool, id); static void _logos_method$_ungrouped$MMDumpReporterMgr$onUploadResult$onTag$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, _Bool, id); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$removeFistTaskData)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMDumpReporterMgr$removeFistTaskData(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$MMDumpReporterMgr$addOneTaskData$)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_method$_ungrouped$MMDumpReporterMgr$addOneTaskData$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$uploadDumpOnIPXX$)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpOnIPXX$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$withReprotCntOneTime$)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id, unsigned long long); static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$withReprotCntOneTime$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id, unsigned long long); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$uploadAllDump)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadAllDump(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$autoUploadDump)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMDumpReporterMgr$autoUploadDump(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$uploadOneTaskData)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadOneTaskData(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$MMDumpReporterMgr$getBackgroundDumpFilePaths)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$MMDumpReporterMgr$getBackgroundDumpFilePaths(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$MMDumpReporterMgr$getDumpFilePaths)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$MMDumpReporterMgr$getDumpFilePaths(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$MMDumpReporterMgr$getCPUDumpFilePaths)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$MMDumpReporterMgr$getCPUDumpFilePaths(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$MMDumpReporterMgr$shouldUpload)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$MMDumpReporterMgr$shouldUpload(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$onEnterBackGround)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMDumpReporterMgr$onEnterBackGround(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$onEnterForgeGround)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMDumpReporterMgr$onEnterForgeGround(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$MMDumpReporterMgr$limitUpload$)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_method$_ungrouped$MMDumpReporterMgr$limitUpload$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$MMDumpReporterMgr$willTerminate)(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMDumpReporterMgr$willTerminate(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST, SEL); static MMDumpReporterMgr* (*_logos_orig$_ungrouped$MMDumpReporterMgr$init)(_LOGOS_SELF_TYPE_INIT MMDumpReporterMgr*, SEL) _LOGOS_RETURN_RETAINED; static MMDumpReporterMgr* _logos_method$_ungrouped$MMDumpReporterMgr$init(_LOGOS_SELF_TYPE_INIT MMDumpReporterMgr*, SEL) _LOGOS_RETURN_RETAINED; 

#line 1 "/Users/jamy/works/wxtweak/wxtweak/MMDumpReportMgr.xm"


static void _logos_method$_ungrouped$MMDumpReporterMgr$onUploadResult$onTag$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd, _Bool arg1, id arg2) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> onUploadResult:%d onTag:%@]", self, arg1, arg2); _logos_orig$_ungrouped$MMDumpReporterMgr$onUploadResult$onTag$(self, _cmd, arg1, arg2); }

static void _logos_method$_ungrouped$MMDumpReporterMgr$removeFistTaskData(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> removeFistTaskData]", self); _logos_orig$_ungrouped$MMDumpReporterMgr$removeFistTaskData(self, _cmd); }

static _Bool _logos_method$_ungrouped$MMDumpReporterMgr$addOneTaskData$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> addOneTaskData:%@]", self, arg1); _Bool r = _logos_orig$_ungrouped$MMDumpReporterMgr$addOneTaskData$(self, _cmd, arg1); HBLogDebug(@" = %d", r); return r; }


static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpOnIPXX$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"-[<MMDumpReporterMgr: %p> uploadDumpOnIPXX:%@]", self, arg1);

    NSLog(@"uploadDumpOnIPXX:arg1 cancle");

}


static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$withReprotCntOneTime$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1, unsigned long long arg2) {
    HBLogDebug(@"-[<MMDumpReporterMgr: %p> uploadDumpWithDate:%@ withReprotCntOneTime:%llu]", self, arg1, arg2);

    
          NSLog(@"uploadDumpWithDate:withReprotCntOneTime cancle");
}


static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    HBLogDebug(@"-[<MMDumpReporterMgr: %p> uploadDumpWithDate:%@]", self, arg1);

        NSLog(@"uploadDumpWithDate cancle");
}


static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadAllDump(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) {
    HBLogDebug(@"-[<MMDumpReporterMgr: %p> uploadAllDump]", self);
    
    NSLog(@"uploadAllDump cancle");
}


static void _logos_method$_ungrouped$MMDumpReporterMgr$autoUploadDump(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd)  {
    HBLogDebug(@"-[<MMDumpReporterMgr: %p> autoUploadDump]", self);
    NSLog(@"autoUploadDump cancle");
}

static void _logos_method$_ungrouped$MMDumpReporterMgr$uploadOneTaskData(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { 
    HBLogDebug(@"-[<MMDumpReporterMgr: %p> uploadOneTaskData]", self);
    NSLog(@"uploadOneTaskData cancle");
}

static id _logos_method$_ungrouped$MMDumpReporterMgr$getBackgroundDumpFilePaths(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> getBackgroundDumpFilePaths]", self); id r = _logos_orig$_ungrouped$MMDumpReporterMgr$getBackgroundDumpFilePaths(self, _cmd); HBLogDebug(@"getBackgroundDumpFilePaths = %@", r); return r; }

static id _logos_method$_ungrouped$MMDumpReporterMgr$getDumpFilePaths(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> getDumpFilePaths]", self); id r = _logos_orig$_ungrouped$MMDumpReporterMgr$getDumpFilePaths(self, _cmd); HBLogDebug(@"getDumpFilePaths = %@", r); return r; }

static id _logos_method$_ungrouped$MMDumpReporterMgr$getCPUDumpFilePaths(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> getCPUDumpFilePaths]", self); id r = _logos_orig$_ungrouped$MMDumpReporterMgr$getCPUDumpFilePaths(self, _cmd); HBLogDebug(@"getCPUDumpFilePaths = %@", r); return r; }

static _Bool _logos_method$_ungrouped$MMDumpReporterMgr$shouldUpload(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> shouldUpload]", self); _Bool r = _logos_orig$_ungrouped$MMDumpReporterMgr$shouldUpload(self, _cmd); HBLogDebug(@"shouldUpload = %d", r); return r; }

static void _logos_method$_ungrouped$MMDumpReporterMgr$onEnterBackGround(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> onEnterBackGround]", self); _logos_orig$_ungrouped$MMDumpReporterMgr$onEnterBackGround(self, _cmd); }

static void _logos_method$_ungrouped$MMDumpReporterMgr$onEnterForgeGround(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> onEnterForgeGround]", self); _logos_orig$_ungrouped$MMDumpReporterMgr$onEnterForgeGround(self, _cmd); }

static _Bool _logos_method$_ungrouped$MMDumpReporterMgr$limitUpload$(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> limitUpload:%@]", self, arg1); _Bool r = _logos_orig$_ungrouped$MMDumpReporterMgr$limitUpload$(self, _cmd, arg1); HBLogDebug(@"limitUpload = %d", r); return r; }

static void _logos_method$_ungrouped$MMDumpReporterMgr$willTerminate(_LOGOS_SELF_TYPE_NORMAL MMDumpReporterMgr* _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"-[<MMDumpReporterMgr: %p> willTerminate]", self); _logos_orig$_ungrouped$MMDumpReporterMgr$willTerminate(self, _cmd); }

static MMDumpReporterMgr* _logos_method$_ungrouped$MMDumpReporterMgr$init(_LOGOS_SELF_TYPE_INIT MMDumpReporterMgr* self, SEL _cmd) _LOGOS_RETURN_RETAINED { HBLogDebug(@"-[<MMDumpReporterMgr: %p> init]", self); id r = _logos_orig$_ungrouped$MMDumpReporterMgr$init(self, _cmd); HBLogDebug(@"MMDumpReporterMgr = %@", r); return r; }


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MMDumpReporterMgr = objc_getClass("MMDumpReporterMgr"); if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(onUploadResult:onTag:), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$onUploadResult$onTag$, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$onUploadResult$onTag$);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(removeFistTaskData), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$removeFistTaskData, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$removeFistTaskData);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(addOneTaskData:), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$addOneTaskData$, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$addOneTaskData$);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(uploadDumpOnIPXX:), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpOnIPXX$, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$uploadDumpOnIPXX$);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(uploadDumpWithDate:withReprotCntOneTime:), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$withReprotCntOneTime$, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$withReprotCntOneTime$);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(uploadDumpWithDate:), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$uploadDumpWithDate$);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(uploadAllDump), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$uploadAllDump, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$uploadAllDump);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(autoUploadDump), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$autoUploadDump, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$autoUploadDump);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(uploadOneTaskData), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$uploadOneTaskData, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$uploadOneTaskData);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(getBackgroundDumpFilePaths), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$getBackgroundDumpFilePaths, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$getBackgroundDumpFilePaths);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(getDumpFilePaths), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$getDumpFilePaths, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$getDumpFilePaths);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(getCPUDumpFilePaths), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$getCPUDumpFilePaths, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$getCPUDumpFilePaths);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(shouldUpload), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$shouldUpload, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$shouldUpload);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(onEnterBackGround), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$onEnterBackGround, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$onEnterBackGround);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(onEnterForgeGround), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$onEnterForgeGround, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$onEnterForgeGround);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(limitUpload:), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$limitUpload$, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$limitUpload$);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(willTerminate), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$willTerminate, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$willTerminate);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}if (_logos_class$_ungrouped$MMDumpReporterMgr) {MSHookMessageEx(_logos_class$_ungrouped$MMDumpReporterMgr, @selector(init), (IMP)&_logos_method$_ungrouped$MMDumpReporterMgr$init, (IMP*)&_logos_orig$_ungrouped$MMDumpReporterMgr$init);} else {HBLogError(@"logos: nil class %s", "MMDumpReporterMgr");}} }
#line 69 "/Users/jamy/works/wxtweak/wxtweak/MMDumpReportMgr.xm"
