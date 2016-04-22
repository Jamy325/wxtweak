#line 1 "/Users/jamy/works/wxtweak/wxtweak/MMMassSendContactSelectorViewController.xm"
#import <UIKit/UIKit.h>

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
@class MMMassSendContactSelectorViewController; 
static void (*_logos_orig$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$)(_LOGOS_SELF_TYPE_NORMAL MMMassSendContactSelectorViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$(_LOGOS_SELF_TYPE_NORMAL MMMassSendContactSelectorViewController* _LOGOS_SELF_CONST, SEL, id); 

#line 3 "/Users/jamy/works/wxtweak/wxtweak/MMMassSendContactSelectorViewController.xm"






































static void _logos_method$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$(_LOGOS_SELF_TYPE_NORMAL MMMassSendContactSelectorViewController* _LOGOS_SELF_CONST self, SEL _cmd, id sender) {
    HBLogDebug(@"-[<MMMassSendContactSelectorViewController: %p> onSelectAll:%@]", self, sender);
    _logos_orig$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$(self, _cmd, sender);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MMMassSendContactSelectorViewController = objc_getClass("MMMassSendContactSelectorViewController"); if (_logos_class$_ungrouped$MMMassSendContactSelectorViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMMassSendContactSelectorViewController, @selector(onSelectAll:), (IMP)&_logos_method$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$, (IMP*)&_logos_orig$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$);} else {HBLogError(@"logos: nil class %s", "MMMassSendContactSelectorViewController");}} }
#line 47 "/Users/jamy/works/wxtweak/wxtweak/MMMassSendContactSelectorViewController.xm"
