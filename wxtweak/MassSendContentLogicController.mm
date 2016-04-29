#line 1 "/Users/jamy/works/wxtweak/wxtweak/MassSendContentLogicController.xm"
#import <UIKit/UIKit.h>
#import "CacheMemoryTestViewController.h"
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
@class MassSendContentLogicController; 
static void (*_logos_orig$_ungrouped$MassSendContentLogicController$OpenDetailInfo)(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MassSendContentLogicController$OpenDetailInfo(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST, SEL); 

#line 6 "/Users/jamy/works/wxtweak/wxtweak/MassSendContentLogicController.xm"






























static void _logos_method$_ungrouped$MassSendContentLogicController$OpenDetailInfo(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST self, SEL _cmd) {
        HBLogDebug(@"-[<MassSendContentLogicController: %p> OpenDetailInfo]", self);
    _logos_orig$_ungrouped$MassSendContentLogicController$OpenDetailInfo(self, _cmd);
    





















 }



static __attribute__((constructor)) void _logosLocalCtor_ca6a4934(int argc, char **argv, char **envp) {
    if (checkPluginCanUse())
    {
        {Class _logos_class$_ungrouped$MassSendContentLogicController = objc_getClass("MassSendContentLogicController"); if (_logos_class$_ungrouped$MassSendContentLogicController) {MSHookMessageEx(_logos_class$_ungrouped$MassSendContentLogicController, @selector(OpenDetailInfo), (IMP)&_logos_method$_ungrouped$MassSendContentLogicController$OpenDetailInfo, (IMP*)&_logos_orig$_ungrouped$MassSendContentLogicController$OpenDetailInfo);} else {HBLogError(@"logos: nil class %s", "MassSendContentLogicController");}}
    }
    
}
