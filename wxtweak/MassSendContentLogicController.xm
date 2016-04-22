#import <UIKit/UIKit.h>
%hook MassSendContentLogicController
/*
- (void)deleteAllMsg { %log; %orig; }
- (void)onTopBarFrameChanged { %log; %orig; }
- (void)onPopFromNavigationController { %log; %orig; }
- (void)onMassSendSendAgain:(id)arg1 { %log; %orig; }
- (void)ViewDidInit { %log; %orig; }
- (void)ViewWillInit { %log; %orig; }
- (void)onNewMassSend:(id)arg1 { %log; %orig; }
- (void)StopPlaying { %log; %orig; }
- (void)OnAddMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)handleToolView { %log; %orig; }
- (void)initIntroView { %log; %orig; }
- (_Bool)CanRotateOrientation { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)CanSelectMyFavoritesItemForSendingMsg { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)CanSend3rdMsg { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)reloadIntroView { %log; %orig; }
- (void)initToolView { %log; %orig; }

- (void)CustomToolViewEX:(id)arg1 { %log; %orig; }
- (void)Register { %log; %orig; }
- (void)UnRegister { %log; %orig; }
- (void)ResendMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)ModMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)DelMsg:(id)arg1 MsgList:(id)arg2 DelAll:(_Bool)arg3 { %log; %orig; }
- (void)ClearUnRead:(id)arg1 FromID:(unsigned int)arg2 ToID:(unsigned int)arg3 { %log; %orig; }
- (id)GetDownMsg:(id)arg1 FromID:(unsigned int)arg2 Limit:(unsigned int)arg3 LeftCount:(unsigned int *)arg4 LeftUnreadCount:(unsigned int *)arg5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetMsg:(id)arg1 FromID:(unsigned int)arg2 Limit:(unsigned int)arg3 LeftCount:(unsigned int *)arg4 LeftUnreadCount:(unsigned int *)arg5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
*/
- (void)OpenDetailInfo {
        %log; 
     
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(210, 80, 100, 100)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [view.layer setShadowOffset:CGSizeMake(10, 10)];
    [view.layer setShadowColor:[[UIColor redColor] CGColor]];
    [view.layer setCornerRadius:15];
    
    UIView* parentView = [self getViewController];
    [[parentView view] addSubview:view];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(10, 10, 80, 20);
    
    //button背景色
    button1.backgroundColor = [UIColor whiteColor];
    
    //设置button填充图片
    //[button1 setImage:[UIImage imageNamed:@"btng.png"] forState:UIControlStateNormal];
    
    //设置button标题
    [button1 setTitle:@"点击xxxx" forState:UIControlStateNormal];
    [button1.layer setCornerRadius:3];
    [view addSubview:button1];
 }
%end
