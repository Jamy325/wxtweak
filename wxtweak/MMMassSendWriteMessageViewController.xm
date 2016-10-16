
#include "wxUtil.h"
#import <objc/runtime.h>


%hook AudioSender
-(id)GetTmpAudio:(uint32_t)arg1
{
    WXLog(@"get tmp audio:%d", arg1);
    id r = %orig(arg1);
    WXLog(@"get tmp audio end");
    return r;
}

%end



%hook MMMassSendWriteMessageViewController
-(void)MassSend:(id)arg1
{
    WXLog(@"massend -- %@", arg1);
    %orig(arg1);
}

-(void)SendRecording
{
    WXLog(@"----send record");
    %orig;
    WXLog(@"----send record end");
}

-(void)initToolView
{
    %orig;
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(210, 70, 100, 30)];
    [btn setTitle:@"发录音" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onMassSendAudio:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [[self view] addSubview:btn];
}

%new
-(void)onMassSendAudio:(id)sender
{
    //WXLog(@"-------onclick----------");
    Method methodMMServiceCenter = class_getClassMethod(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
    IMP impMMSC = method_getImplementation(methodMMServiceCenter);
    id MMServiceCenter = impMMSC(objc_getClass("MMServiceCenter"), @selector(defaultCenter));

    //通讯录管理器
    id audioSender = ((id (*)(id, SEL, Class))objc_msgSend)(MMServiceCenter, @selector(getService:), objc_getClass("AudioSender"));
    
    id tmpAudio = objc_msgSend(audioSender, @selector(GetTmpAudio:), (id)0);
    if (!tmpAudio)
    {
        WXLog(@"tmp audio not find");
        return;
    }

    // WXLog(@" ------------get audio length:%@", tmpAudio);
    [tmpAudio retain];
    int length = (int)objc_msgSend(tmpAudio, @selector(length));
    if (length == 0 ) 
    {
        WXLog(@"length == 0");
        [tmpAudio release];
        return;
    }
    // WXLog(@" ------------get mass send wrap class");
    Class MassSendWrap = objc_getClass("MassSendWrap");
    id msg = [[MassSendWrap alloc] init];
    [msg retain];
       // WXLog(@" ------------setM_uiMessageType");
    objc_msgSend(msg, @selector(setM_uiMessageType:), (id)(0x22));
           // WXLog(@" ------------setM_dtVoice");
    objc_msgSend(msg, @selector(setM_dtVoice:), tmpAudio);
         //   WXLog(@" ------------setM_dtVoiceTime");
    objc_msgSend(msg, @selector(setM_uiVoiceTime:), (id)(((length % 50)+10)*1000));
       //         WXLog(@" ------------voic tmp id");
    objc_msgSend(msg, @selector(setM_uiVoiceTmpID:), (id)(0));
     //           WXLog(@" ------------get allUsrName");
    id allUsrName = objc_msgSend(self, @selector(getAllUsrName));
   //             WXLog(@" ------------setM_arrayToList");
    objc_msgSend(msg, @selector(setM_arrayToList:), allUsrName);
 //WXLog(@" ------------set voiceFormat");
    objc_msgSend(msg, @selector(setM_voiceFormat:), (id)(4));
 //WXLog(@" ------------massend");
    objc_msgSend(self, @selector(MassSend:), msg);
// WXLog(@" ------------end---");
    [msg release];
    [tmpAudio release];

//    Ivar recordControllerIvar = class_getInstanceVariable([objc_getClass("MMMassSendWriteMessageViewController") class], "_recordController");
//    id record = object_getIvar(self, recordControllerIvar);
//    
//
//    Ivar currentRecordFormat = class_getInstanceVariable([objc_getClass("MMMassSendWriteMessageViewController") class], "m_currentRecordFormat");
//
//    object_setIvar(self, currentRecordFormat, (id)4);
//    
//
//    [record setM_uiTmpRecordID:0];
//    
//      Ivar currentTmpFormat = class_getInstanceVariable([objc_getClass("RecordController") class], "m_currentTmpFormat");
//
//    object_setIvar(record, currentTmpFormat, (id)4);
//
//    [self SendRecording];
}

%end


%ctor {
    if (checkPluginCanUse())
    {
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}
