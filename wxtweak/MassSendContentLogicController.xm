#import <UIKit/UIKit.h>
#import "CacheMemoryTestViewController.h"
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
    %orig;
    /*
    Method methodMMServiceCenter = class_getClassMethod(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
    IMP impMMSC = method_getImplementation(methodMMServiceCenter);
    id MMServiceCenter = impMMSC(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
    //通讯录管理器
    id contactManager = ((id (*)(id, SEL, Class))objc_msgSend)(MMServiceCenter, @selector(getService:), objc_getClass("CContactMgr"));
    
    NSMutableArray* arrKey = [[NSMutableArray alloc] init ];
    NSMutableArray* pContactList = objc_msgSend(contactManager, @selector(getContactList:contactType:domain:), 1, 0xffffffff, arrKey);
    NSInteger cnt = (NSInteger)objc_msgSend(pContactList, @selector(count));
    NSLog(@"=====group member list:%d====", cnt);
    int n = cnt / 200;
    int l = cnt % 200;
    if (l > 0) n += 1;
    CacheMemoryTestViewController* con = [[CacheMemoryTestViewController alloc] initWithCount:n];
    ZSYPopoverListView *listView = [[ZSYPopoverListView alloc] initWithFrame:CGRectMake(0, 0, 300, 420)];
    listView.titleName.text = [NSString stringWithFormat:@"分批群发:(共%d人，分%d批)", cnt, n ];
    listView.datasource = con;
    listView.delegate = con;
    [listView show];
    [listView release];
    [con release];*/
 }
%end
