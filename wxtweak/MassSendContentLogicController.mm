#line 1 "/Users/jamy/works/wxtweak/wxtweak/MassSendContentLogicController.xm"
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

#line 1 "/Users/jamy/works/wxtweak/wxtweak/MassSendContentLogicController.xm"
#import <UIKit/UIKit.h>






























static void _logos_method$_ungrouped$MassSendContentLogicController$OpenDetailInfo(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST self, SEL _cmd) {
        HBLogDebug(@"-[<MassSendContentLogicController: %p> OpenDetailInfo]", self); 
     
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(200, 80, 100, 100)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [view.layer setShadowOffset:CGSizeMake(10, 10)];
    [view.layer setShadowColor:[[UIColor redColor] CGColor]];
    [view.layer setCornerRadius:15];
    
    UIView* parentView = [self getViewController];
    [[parentView view] addSubview:view];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(10, 10, 80, 20);
    
    
    button1.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    [button1 setTitle:@"点击xxxx" forState:UIControlStateNormal];
    [button1.layer setCornerRadius:3];
    [view addSubview:button1];
 }

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MassSendContentLogicController = objc_getClass("MassSendContentLogicController"); if (_logos_class$_ungrouped$MassSendContentLogicController) {MSHookMessageEx(_logos_class$_ungrouped$MassSendContentLogicController, @selector(OpenDetailInfo), (IMP)&_logos_method$_ungrouped$MassSendContentLogicController$OpenDetailInfo, (IMP*)&_logos_orig$_ungrouped$MassSendContentLogicController$OpenDetailInfo);} else {HBLogError(@"logos: nil class %s", "MassSendContentLogicController");}} }
#line 58 "/Users/jamy/works/wxtweak/wxtweak/MassSendContentLogicController.xm"
