#line 1 "/Users/jamy/works/wxtweak/wxtweak/MMMassSendContactSelectorViewController.xm"
#import <UIKit/UIKit.h>
#import "CacheMemoryTestViewController.h"

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

#line 4 "/Users/jamy/works/wxtweak/wxtweak/MMMassSendContactSelectorViewController.xm"






































static void _logos_method$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$(_LOGOS_SELF_TYPE_NORMAL MMMassSendContactSelectorViewController* _LOGOS_SELF_CONST self, SEL _cmd, id sender) {
    HBLogDebug(@"-[<MMMassSendContactSelectorViewController: %p> onSelectAll:%@]", self, sender);

    Method methodMMServiceCenter = class_getClassMethod(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
    IMP impMMSC = method_getImplementation(methodMMServiceCenter);
    id MMServiceCenter = impMMSC(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
    
    id contactManager = ((id (*)(id, SEL, Class))objc_msgSend)(MMServiceCenter, @selector(getService:), objc_getClass("CContactMgr"));
    
    
    
    Ivar arrAllContactIvar = class_getInstanceVariable([objc_getClass("MMMassSendContactSelectorViewController") class], "_arrAllContacts");
    NSMutableArray* pContactList = object_getIvar(self, arrAllContactIvar);
    NSInteger cnt = (NSInteger)objc_msgSend(pContactList, @selector(count));
    NSLog(@"=====group member list:%d====", cnt);
    int n = cnt / 200;
    int l = cnt % 200;
    if (l > 0) n += 1;
        CacheMemoryTestViewController* con = [[CacheMemoryTestViewController alloc] initWithArray:pContactList controller:self];
        ZSYPopoverListView *listView = [[ZSYPopoverListView alloc] initWithFrame:CGRectMake(0, 0, 300, 420)];
        listView.titleName.text = [NSString stringWithFormat:@"分批群发:(共%d人，分%d批)", cnt, n ];
        listView.datasource = con;
        listView.delegate = con;
        [listView show];
    [listView release];
    [con release];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MMMassSendContactSelectorViewController = objc_getClass("MMMassSendContactSelectorViewController"); if (_logos_class$_ungrouped$MMMassSendContactSelectorViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMMassSendContactSelectorViewController, @selector(onSelectAll:), (IMP)&_logos_method$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$, (IMP*)&_logos_orig$_ungrouped$MMMassSendContactSelectorViewController$onSelectAll$);} else {HBLogError(@"logos: nil class %s", "MMMassSendContactSelectorViewController");}} }
#line 71 "/Users/jamy/works/wxtweak/wxtweak/MMMassSendContactSelectorViewController.xm"
