#line 1 "/Users/jamy/works/wxtweak/wxtweak/MMMassSendWriteMessageViewController.xm"

#include "wxUtil.h"
#import <objc/runtime.h>


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
@class MMMassSendWriteMessageViewController; @class AudioSender; 
static id (*_logos_orig$_ungrouped$AudioSender$GetTmpAudio$)(_LOGOS_SELF_TYPE_NORMAL AudioSender* _LOGOS_SELF_CONST, SEL, uint32_t); static id _logos_method$_ungrouped$AudioSender$GetTmpAudio$(_LOGOS_SELF_TYPE_NORMAL AudioSender* _LOGOS_SELF_CONST, SEL, uint32_t); static void (*_logos_orig$_ungrouped$MMMassSendWriteMessageViewController$MassSend$)(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$MassSend$(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$MMMassSendWriteMessageViewController$SendRecording)(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$SendRecording(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MMMassSendWriteMessageViewController$initToolView)(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$initToolView(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$onMassSendAudio$(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL, id); 

#line 6 "/Users/jamy/works/wxtweak/wxtweak/MMMassSendWriteMessageViewController.xm"


static id _logos_method$_ungrouped$AudioSender$GetTmpAudio$(_LOGOS_SELF_TYPE_NORMAL AudioSender* _LOGOS_SELF_CONST self, SEL _cmd, uint32_t arg1) {
    WXLog(@"get tmp audio:%d", arg1);
    id r = _logos_orig$_ungrouped$AudioSender$GetTmpAudio$(self, _cmd, arg1);
    WXLog(@"get tmp audio end");
    return r;
}







static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$MassSend$(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST self, SEL _cmd, id arg1) {
    WXLog(@"massend -- %@", arg1);
    _logos_orig$_ungrouped$MMMassSendWriteMessageViewController$MassSend$(self, _cmd, arg1);
}


static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$SendRecording(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST self, SEL _cmd) {
    WXLog(@"----send record");
    _logos_orig$_ungrouped$MMMassSendWriteMessageViewController$SendRecording(self, _cmd);
    WXLog(@"----send record end");
}


static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$initToolView(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST self, SEL _cmd) {
    _logos_orig$_ungrouped$MMMassSendWriteMessageViewController$initToolView(self, _cmd);
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(210, 70, 100, 30)];
    [btn setTitle:@"发录音" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onMassSendAudio:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [[self view] addSubview:btn];
}



static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$onMassSendAudio$(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST self, SEL _cmd, id sender) {
    
    Method methodMMServiceCenter = class_getClassMethod(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
    IMP impMMSC = method_getImplementation(methodMMServiceCenter);
    id MMServiceCenter = impMMSC(objc_getClass("MMServiceCenter"), @selector(defaultCenter));

    
    id audioSender = ((id (*)(id, SEL, Class))objc_msgSend)(MMServiceCenter, @selector(getService:), objc_getClass("AudioSender"));
    
    id tmpAudio = objc_msgSend(audioSender, @selector(GetTmpAudio:), (id)0);
    if (!tmpAudio)
    {
        WXLog(@"tmp audio not find");
        return;
    }

    
    [tmpAudio retain];
    int length = (int)objc_msgSend(tmpAudio, @selector(length));
    if (length == 0 ) 
    {
        WXLog(@"length == 0");
        [tmpAudio release];
        return;
    }
    
    Class MassSendWrap = objc_getClass("MassSendWrap");
    id msg = [[MassSendWrap alloc] init];
    [msg retain];
       
    objc_msgSend(msg, @selector(setM_uiMessageType:), (id)(0x22));
           
    objc_msgSend(msg, @selector(setM_dtVoice:), tmpAudio);
         
    objc_msgSend(msg, @selector(setM_uiVoiceTime:), (id)(((length % 50)+10)*1000));
       
    objc_msgSend(msg, @selector(setM_uiVoiceTmpID:), (id)(0));
     
    id allUsrName = objc_msgSend(self, @selector(getAllUsrName));
   
    objc_msgSend(msg, @selector(setM_arrayToList:), allUsrName);
 
    objc_msgSend(msg, @selector(setM_voiceFormat:), (id)(4));
 
    objc_msgSend(self, @selector(MassSend:), msg);

    [msg release];
    [tmpAudio release];

















}




static __attribute__((constructor)) void _logosLocalCtor_18bd9d6c(int argc, char **argv, char **envp) {
    if (checkPluginCanUse())
    {
        {Class _logos_class$_ungrouped$AudioSender = objc_getClass("AudioSender"); if (_logos_class$_ungrouped$AudioSender) {MSHookMessageEx(_logos_class$_ungrouped$AudioSender, @selector(GetTmpAudio:), (IMP)&_logos_method$_ungrouped$AudioSender$GetTmpAudio$, (IMP*)&_logos_orig$_ungrouped$AudioSender$GetTmpAudio$);} else {HBLogError(@"logos: nil class %s", "AudioSender");}Class _logos_class$_ungrouped$MMMassSendWriteMessageViewController = objc_getClass("MMMassSendWriteMessageViewController"); if (_logos_class$_ungrouped$MMMassSendWriteMessageViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMMassSendWriteMessageViewController, @selector(MassSend:), (IMP)&_logos_method$_ungrouped$MMMassSendWriteMessageViewController$MassSend$, (IMP*)&_logos_orig$_ungrouped$MMMassSendWriteMessageViewController$MassSend$);} else {HBLogError(@"logos: nil class %s", "MMMassSendWriteMessageViewController");}if (_logos_class$_ungrouped$MMMassSendWriteMessageViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMMassSendWriteMessageViewController, @selector(SendRecording), (IMP)&_logos_method$_ungrouped$MMMassSendWriteMessageViewController$SendRecording, (IMP*)&_logos_orig$_ungrouped$MMMassSendWriteMessageViewController$SendRecording);} else {HBLogError(@"logos: nil class %s", "MMMassSendWriteMessageViewController");}if (_logos_class$_ungrouped$MMMassSendWriteMessageViewController) {MSHookMessageEx(_logos_class$_ungrouped$MMMassSendWriteMessageViewController, @selector(initToolView), (IMP)&_logos_method$_ungrouped$MMMassSendWriteMessageViewController$initToolView, (IMP*)&_logos_orig$_ungrouped$MMMassSendWriteMessageViewController$initToolView);} else {HBLogError(@"logos: nil class %s", "MMMassSendWriteMessageViewController");}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$MMMassSendWriteMessageViewController, @selector(onMassSendAudio:), (IMP)&_logos_method$_ungrouped$MMMassSendWriteMessageViewController$onMassSendAudio$, _typeEncoding); }}
    }
    
}
