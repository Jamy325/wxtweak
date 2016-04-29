#include "wxUtil.h"

%hook GameStatMgr
+ (id)genExternInfoWithNoticeID:(id)arg1 withNew:(_Bool)arg2 sourceScene:(int)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)genExternInfoWithNoticeID:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setDictScene2LayerID:(NSMutableDictionary *)dictScene2LayerID { %log; %orig; }
- (NSMutableDictionary *)dictScene2LayerID { %log; NSMutableDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setGameDescSDK:(NSMutableDictionary *)gameDescSDK { %log; %orig; }
- (NSMutableDictionary *)gameDescSDK { %log; NSMutableDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setGameLaunchTime:(NSMutableDictionary *)gameLaunchTime { %log; %orig; }
- (NSMutableDictionary *)gameLaunchTime { %log; NSMutableDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setUUID:(NSString *)UUID { %log; %orig; }
- (NSString *)UUID { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setNetworkType:(unsigned int )networkType { %log; %orig; }
- (unsigned int )networkType { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }

- (_Bool)writeToFile:(id)arg1 data:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)loadAppInfoExtend { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)saveAppInfoExtend { %log; %orig; }
- (id)convertStr:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isGameForStat:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (_Bool)uploadGameReport:(unsigned int)arg1 withLogExt:(id)arg2 { %log;  return YES; }
- (void)statGameCenterAppstoreInfo:(id)arg1 productIdentifier:(id)arg2 errCode:(unsigned int)arg3 { %log; %orig; }
- (void)statGameHallViewWithRedDotOrNew:(int)arg1 appID:(id)arg2 opType:(int)arg3 noticeID:(id)arg4 { %log; %orig; }
- (void)statDiffAccountShare:(id)arg1 appID:(id)arg2 withOpID:(unsigned int)arg3 { %log; %orig; }
- (void)gameStatReport:(id)arg1 scenc:(int)arg2 opType:(int)arg3 fromUsrName:(id)arg4 msgType:(unsigned int)arg5 msgID:(unsigned int)arg6 sourceScenc:(int)arg7 msgSubType:(unsigned int)arg8 giftId:(id)arg9 giftUrl:(id)arg10 extInfo:(id)arg11 { %log; %orig; }
- (void)statGameCenterClickAddSubMsgType:(id)arg1 scenc:(int)arg2 opType:(int)arg3 fromUsrName:(id)arg4 msgType:(unsigned int)arg5 msgID:(unsigned int)arg6 sourceScenc:(int)arg7 msgSubType:(unsigned int)arg8 noticeID:(id)arg9 { %log; %orig; }
- (void)statGameCenterClick:(id)arg1 scenc:(int)arg2 opType:(int)arg3 fromUsrName:(id)arg4 msgType:(unsigned int)arg5 msgID:(unsigned int)arg6 sourceScenc:(int)arg7 { %log; %orig; }
- (void)statGameCenterClickSimpleWithExternField:(id)arg1 scenc:(int)arg2 opType:(int)arg3 noticeID:(id)arg4 withNew:(_Bool)arg5 { %log; %orig; }
- (void)statGameCenterClickSimpleWithExternField:(id)arg1 scenc:(int)arg2 opType:(int)arg3 noticeID:(id)arg4 withNew:(_Bool)arg5 sourceScene:(int)arg6 WithDownloadType:(unsigned long long)arg7 WithIsSubscribed:(_Bool)arg8 { %log; %orig; }
- (void)statGameCenterClickSimpleWithExternField:(id)arg1 scenc:(int)arg2 opType:(int)arg3 noticeID:(id)arg4 withNew:(_Bool)arg5 sourceScene:(int)arg6 { %log; %orig; }
- (void)statGameCenterClickSimple:(id)arg1 scenc:(int)arg2 opType:(int)arg3 { %log; %orig; }
- (void)statGameCenterClickWithExtInfo:(id)arg1 scenc:(int)arg2 opType:(int)arg3 fromUsrName:(id)arg4 msgType:(unsigned int)arg5 msgID:(unsigned int)arg6 sourceScenc:(int)arg7 extInfo:(id)arg8 { %log; %orig; }
- (void)statGameDetailView:(id)arg1 sourceScene:(int)arg2 { %log; %orig; }
- (void)statGameSettingDetailView:(id)arg1 isReceived:(_Bool)arg2 { %log; %orig; }
- (void)statDeleteMsgInConversation:(id)arg1 { %log; %orig; }
- (void)statRefuseMsgInGameSettingView:(id)arg1 isReceived:(_Bool)arg2 { %log; %orig; }
- (void)statRefuseMsgInConversation:(id)arg1 isReceived:(_Bool)arg2 { %log; %orig; }
- (void)statLoadMoreGameMsgs { %log; %orig; }
- (void)statGameMsgListReadStatus:(id)arg1 { %log; %orig; }
- (void)statClickTimeLineTextTail:(id)arg1 opType:(int)arg2 { %log; %orig; }
- (void)statClickTimeLineMessage:(id)arg1 isSource:(_Bool)arg2 { %log; %orig; }
- (void)statClickInConversation:(id)arg1 isSource:(_Bool)arg2 { %log; %orig; }
- (void)statShowInAD:(id)arg1 index:(unsigned int)arg2 { %log; %orig; }
- (void)statShowConversation:(id)arg1 { %log; %orig; }
- (void)statShowTimeLineMessage:(id)arg1 { %log; %orig; }
- (void)endStatAppInfoExtend { %log; %orig; }
- (void)statAppInfoExtend:(id)arg1 withLaunchTime:(id)arg2 withAppDescSDK:(id)arg3 { %log; %orig; }
- (void)startStatAppInfoExtend { %log; %orig; }
- (void)initScene2LayerID { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end

%ctor {
    if (checkPluginCanUse()){
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}