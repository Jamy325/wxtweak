#include "wxUtil.h"

%hook CMessageMgr

+ (id)GetPathOfOpenUploadCDNFile { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfOpenUploadFile { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)onDownOpenMsgModMsg:(id)arg1 MsgWrap:(id)arg2 BitSet:(unsigned int)arg3 { %log; %orig; }
- (void)onUploadImageCheckQQ { %log; %orig; }
- (void)onUploadImageModMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)onUploadImageModMsgByBitSet:(id)arg1 MsgWrap:(id)arg2 BitSet:(unsigned int)arg3 { %log; %orig; }
- (void)onModMsgByBitSet:(id)arg1 MsgWrap:(id)arg2 BitSet:(unsigned int)arg3 { %log; %orig; }
- (id)onGetMsg:(id)arg1 LocalID:(unsigned int)arg2 Wrap:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)onGetBigImageErrorWithWrap:(id)arg1 { %log; %orig; }
- (void)onGetBigImageResultWithWrap:(id)arg1 image:(id)arg2 imageData:(id)arg3 isSaveImgOK:(_Bool *)arg4 { %log; %orig; }
- (void)onUploadImageRequestWithWrap:(id)arg1 { %log; %orig; }
- (void)enterBackground { %log; %orig; }
- (void)enterForeground { %log; %orig; }
- (void)reSendAllMsgFromNotificationDone { %log; %orig; }
- (id)getSentFailMsgs { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)OnModMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)onAuthOK { %log; %orig; }
- (id)getSemaphore { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)IsRecordMsgDownloading:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)StopDownloadRecordMsg:(id)arg1 { %log; %orig; }
- (void)StartDownloadByRecordData:(id)arg1 DataId:(id)arg2 { %log; %orig; }
- (void)StartDownloadByRecordMsg:(id)arg1 { %log; %orig; }
- (void)StopUploadRecordMsgByUsername:(id)arg1 { %log; %orig; }
- (void)StopUploadRecordMsg:(id)arg1 { %log; %orig; }
- (void)ResendRecordMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddRecordMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)StartDownloadAppAttach:(id)arg1 MsgWrap:(id)arg2 AttachId:(id)arg3 AttachDataSize:(unsigned int)arg4 AttachFileExt:(id)arg5 { %log; %orig; }
- (_Bool)InAppAttachDownloading:(id)arg1 MsgWrap:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)InAppAttachDownloading:(id)arg1 MsgWrap:(id)arg2 AttachId:(id)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)RollbackTransaction { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)CommitTransaction { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)BeginTransaction { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)DBContext { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)onDiskStorageWarningCleanedSize:(unsigned int *)arg1 { %log; %orig; }
- (void)addAutoCleanTask { %log; %orig; }
- (unsigned int)GetDownloadThumbStatus:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (_Bool)StartDownloadThumb:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (unsigned int)GetUploadPercent:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)GetDownloadImageTotalLen:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)GetDownloadImagePartLen:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)StopDownloadImage:(id)arg1 { %log; %orig; }
- (void)StartDownloadImage:(id)arg1 HD:(_Bool)arg2 { %log; %orig; }
- (unsigned int)GetImgOrVideoMsgCount:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)GetImgOrVideoMsgCount:(id)arg1 FromID:(unsigned int)arg2 CreateTime:(unsigned int)arg3 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (id)GetImgOrVideoNextMsg:(id)arg1 FromID:(unsigned int)arg2 CreateTime:(unsigned int)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetImgOrVideoLastMsg:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetImgOrVideoLastMsg:(id)arg1 FromID:(unsigned int)arg2 CreateTime:(unsigned int)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetImgAndVideoMsgList:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetImgMsgList:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned int)GetImgMsgCount:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)GetImgMsgCount:(id)arg1 FromID:(unsigned int)arg2 CreateTime:(unsigned int)arg3 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (id)GetImgLastMsg:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetImgLastMsg:(id)arg1 FromID:(unsigned int)arg2 CreateTime:(unsigned int)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetImgNextMsg:(id)arg1 FromID:(unsigned int)arg2 CreateTime:(unsigned int)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)onServiceClearData { %log; %orig; }
- (_Bool)onServiceMemoryWarning { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)onServiceInit { %log; %orig; }
- (void)CheckQQPwd { %log; %orig; }
- (void)UpdateVideoMsg:(id)arg1 { %log; %orig; }
- (void)OnErrorByReceiver:(id)arg1 ErrNo:(int)arg2 { %log; %orig; }
- (void)OnErrorBySender:(id)arg1 ErrNo:(int)arg2 { %log; %orig; }
- (void)OnMessageSentBySender:(id)arg1 { %log; %orig; }
- (void)OnAddMessageByReceiver:(id)arg1 { %log; %orig; }
- (void)OnAddMessageBySender:(id)arg1 { %log; %orig; }
- (void)MessageReturn:(unsigned int)arg1 MessageInfo:(id)arg2 Event:(unsigned int)arg3 { %log; %orig; }
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (void)HandleSvrCmd:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)DelMsgPatten:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (id)GetLastMsgToUsr:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetLastMsgFromUsr:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)ModVoipMsgStatus:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)CheckQueue { %log; %orig; }
- (id)GetRealChatName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)StopDownloadAppAttach:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)StartDownloadAppAttach:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddAppMsg:(id)arg1 MsgWrap:(id)arg2 Data:(id)arg3 Scene:(unsigned int)arg4 { %log; %orig; }
- (void)StartUploadAppMsg:(id)arg1 MsgWrap:(id)arg2 Scene:(unsigned int)arg3 { %log; %orig; }
- (void)SetGetLocationEnd:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)UpdateEmoticonMsg:(id)arg1 { %log; %orig; }
- (void)SetEmoticonGameEnd:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)StartDownloadEmoticon:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddEmoticonMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (_Bool)AddBackupMsg:(id)arg1 MsgWrap:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)backupMsgSrvIDExit:(id)arg1 MsgWrap:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)backupGetMsg:(id)arg1 n64SvrID:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)AddLocalMsg:(id)arg1 MsgWrap:(id)arg2 fixTime:(_Bool)arg3 NewMsgArriveNotify:(_Bool)arg4 { %log; %orig; }
- (void)AddLocalMsg:(id)arg1 MsgWrap:(id)arg2 fixTime:(_Bool)arg3 NewMsgArriveNotify:(_Bool)arg4 Unique:(_Bool)arg5 { %log; %orig; }
- (void)AddLocalMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddUniqueLocalMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddPimMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)DropChatTable:(id)arg1 { %log; %orig; }
- (void)AddFloatBottle:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)StopDownloadVideoByChatName:(id)arg1 { %log; %orig; }
- (void)StopDownloadVideo:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)StartDownloadVideo:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (_Bool)InternalStartDownloadShortVideo:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)StartDownloadShortVideo:(id)arg1 { %log; %orig; }
- (void)StopUploadVideoByChatName:(id)arg1 { %log; %orig; }
- (void)StopUploadVideo:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)StartUploadVideo:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddShortVideoLocalMsg:(id)arg1 ToUsr:(id)arg2 VideoInfo:(id)arg3 MsgType:(unsigned int)arg4 { %log; %orig; }
- (void)AddVideoMsg:(id)arg1 ToUsr:(id)arg2 VideoInfo:(id)arg3 MsgType:(unsigned int)arg4 { %log; %orig; }
- (void)ResendSightMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddShortVideoMsg:(id)arg1 ToUsr:(id)arg2 VideoInfo:(id)arg3 { %log; %orig; }
- (void)AddVideoMsg:(id)arg1 ToUsr:(id)arg2 VideoInfo:(id)arg3 { %log; %orig; }
- (void)UpdateMessage:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)UpdateVoiceMessage:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)UpdateVoiceStatus:(id)arg1 LocalID:(unsigned int)arg2 DownloadStatus:(unsigned int)arg3 { %log; %orig; }
- (unsigned int)GetMesCount:(id)arg1 MesType:(unsigned int)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)GetAllMesCount:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)GetUnReadCountInHello:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)GetCountInHello:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)GetUnReadCount:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (void)DelMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)DelMsg:(id)arg1 MsgList:(id)arg2 DelAll:(_Bool)arg3 { %log; %orig; }
- (void)ClearUnreadForSync:(id)arg1 CreateTime:(unsigned int)arg2 { %log; %orig; }
- (void)ClearUnRead:(id)arg1 FromID:(unsigned int)arg2 ToID:(unsigned int)arg3 { %log; %orig; }
- (unsigned int)GetSayHelloStatus:(id)arg1 LocalID:(unsigned int)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (_Bool)SetSayHelloStatus:(id)arg1 LocalID:(unsigned int)arg2 Status:(unsigned int)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)AddHelloMsgList:(id)arg1 MsgList:(id)arg2 { %log; %orig; }
- (void)AddHelloMsg:(id)arg1 MsgWrap:(id)arg2 HelloUser:(id)arg3 OpCode:(unsigned int)arg4 DES:(unsigned int)arg5 checkCreateTime:(_Bool)arg6 status:(unsigned int)arg7 { %log; %orig; }
- (_Bool)ClearHelloUnRead:(id)arg1 HelloUser:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)DelHelloMsg:(id)arg1 HelloUser:(id)arg2 { %log; %orig; }
- (id)GetHelloMsg:(id)arg1 HelloUser:(id)arg2 Limit:(unsigned int)arg3 OnlyTo:(_Bool)arg4 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetHelloUsers:(id)arg1 Limit:(unsigned int)arg2 OnlyUnread:(_Bool)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)CheckMessageStatus:(id)arg1 Msg:(id)arg2 { %log; %orig; }
- (id)GetFirstUnreadMsg:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetLastMsg:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned int)GetTextMsgCount:(id)arg1 FromID:(unsigned int)arg2 ToID:(unsigned int)arg3 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (id)GetTextMsg:(id)arg1 FromID:(unsigned int)arg2 ToID:(unsigned int)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetTextMsg:(id)arg1 FromID:(unsigned int)arg2 Limit:(unsigned int)arg3 LeftCount:(unsigned int *)arg4 LeftUnreadCount:(unsigned int *)arg5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetMsg:(id)arg1 BizMsgClientID:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetMsg:(id)arg1 n64SvrID:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetMsg:(id)arg1 LocalID:(unsigned int)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)QueryMsgFromChat:(id)arg1 queryText:(id)arg2 FromID:(unsigned int)arg3 FromCreateTime:(unsigned int)arg4 Limit:(unsigned int)arg5 LeftCount:(unsigned int *)arg6 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetDownMsgByCreateTime:(id)arg1 FromID:(unsigned int)arg2 FromCreateTime:(unsigned int)arg3 Limit:(unsigned int)arg4 LeftCount:(unsigned int *)arg5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetMsgByCreateTime:(id)arg1 FromID:(unsigned int)arg2 FromCreateTime:(unsigned int)arg3 Limit:(unsigned int)arg4 LeftCount:(unsigned int *)arg5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetDownMsg:(id)arg1 FromID:(unsigned int)arg2 Limit:(unsigned int)arg3 LeftCount:(unsigned int *)arg4 LeftUnreadCount:(unsigned int *)arg5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetMsg:(id)arg1 FromID:(unsigned int)arg2 Limit:(unsigned int)arg3 LeftCount:(unsigned int *)arg4 LeftUnreadCount:(unsigned int *)arg5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)AddMsgPattern:(id)arg1 { %log; %orig; }
- (void)HandleMsgList:(id)arg1 MsgList:(id)arg2 { %log; %orig; }
- (void)ResendMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)ModMsgByBitSet:(id)arg1 MsgWrap:(id)arg2 BitSet:(unsigned int)arg3 { %log; %orig; }
- (void)ModMsgWithoutNotify:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)ModMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AddMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)onRevokeMsg:(id)arg1 { %log; %orig; }
- (void)onRevokeMsgCgiReturn:(id)arg1 { %log; %orig; }
- (_Bool)RevokeMsg:(id)arg1 MsgWrap:(id)arg2 Counter:(unsigned int)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)AsyncOnCheckQQ { %log; %orig; }
- (void)AsyncOnModMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (_Bool)IsVideoMsgdDownloadIng:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)IsVideoMsgUploadIng:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)InitMsgMgr:(id)arg1 Lock:(id)arg2 { %log; %orig; }
- (_Bool)SaveMesVoice:(id)arg1 MsgWrap:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)SaveMsgThumb:(id)arg1 MsgWrap:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)SaveMesImg:(id)arg1 MsgWrap:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)MainThreadNotifyToExt:(id)arg1 { %log; %orig; }
- (void)AsyncOnPushMsg:(id)arg1 { %log; %orig; }
- (void)AsyncOnDelMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AsyncOnSendVoiceError:(id)arg1 MsgWrap:(id)arg2 ErroNO:(unsigned int)arg3 { %log; %orig; }
- (void)AsyncOnUnReadChange:(id)arg1 { %log; %orig; }
- (void)AsyncOnDelMsg:(id)arg1 DelAll:(_Bool)arg2 { %log; %orig; }
- (void)AsyncOnDelMsg:(id)arg1 { %log; %orig; }
- (void)AsyncOnMsgNotAddDBSession:(id)arg1 MsgList:(id)arg2 { %log; %orig; }
- (void)AsyncOnSpecialSession:(id)arg1 MsgList:(id)arg2 { %log; %orig; }
- (void)AsyncOnNotAddDBMessage:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AsyncOnAddMsgForSession:(id)arg1 MsgWrap:(id)arg2 NewMsgArriveNotify:(_Bool)arg3 { %log; %orig; }
- (void)AsyncOnAddMsgForSession:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)AsyncOnAddMsgListForSession:(id)arg1 NotifyUsrName:(id)arg2 { %log; %orig; }

- (void)AsyncOnPreAddMsg:(id)arg1 MsgWrap:(id)arg2 { %log; %orig; }
- (void)UpdateVideoStatus:(id)arg1 { %log; %orig; }
- (_Bool)IsRecordMsgUploading:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)IsImageMsgUploadIng:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)escapeKeywordForQueryString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isContact:(id)arg1 ConfirmToQueryString:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)BackGroundAddHelloMsg:(id)arg1 { %log; %orig; }


- (void)AsyncOnAddMsg:(id)arg1 MsgWrap:(id)arg2
{
    
    %log;
    %orig;
    
    /**
     *  插件功能
     */
//    static int const kCloseRedEnvPlugin = 0;
//    static int const kOpenRedEnvPlugin = 1;
//    static int const kCloseRedEnvPluginForMyself = 2;
//    static int const kCloseRedEnvPluginForMyselfFromChatroom = 3;
//    
//    //0：关闭红包插件
//    //1：打开红包插件
//    //2: 不抢自己的红包
//    //3: 不抢群里自己发的红包
//    static int HBPliginType = 0;
    
    Ivar uiMessageTypeIvar = class_getInstanceVariable(objc_getClass("CMessageWrap"), "m_uiMessageType");
    ptrdiff_t offset = ivar_getOffset(uiMessageTypeIvar);
    unsigned char *stuffBytes = (unsigned char *)(__bridge void *)arg2;
    NSUInteger m_uiMessageType = * ((NSUInteger *)(stuffBytes + offset));
    
    Ivar nsFromUsrIvar = class_getInstanceVariable(objc_getClass("CMessageWrap"), "m_nsFromUsr");
    id m_nsFromUsr = object_getIvar(arg2, nsFromUsrIvar);
    
    Ivar nsContentIvar = class_getInstanceVariable(objc_getClass("CMessageWrap"), "m_nsContent");
    id m_nsContent = object_getIvar(arg2, nsContentIvar);

    switch(m_uiMessageType) {
        case 1:
        {
            break;
        }
        case 49:
        {
                // 49=红包
                //微信的服务中心
                Method methodMMServiceCenter = class_getClassMethod(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
                IMP impMMSC = method_getImplementation(methodMMServiceCenter);
                id MMServiceCenter = impMMSC(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
                //红包控制器
                id logicMgr = ((id (*)(id, SEL, Class))objc_msgSend)(MMServiceCenter, @selector(getService:),objc_getClass("WCRedEnvelopesLogicMgr"));
                //通讯录管理器
                id contactManager = ((id (*)(id, SEL, Class))objc_msgSend)(MMServiceCenter, @selector(getService:),objc_getClass("CContactMgr"));
                
                Method methodGetSelfContact = class_getInstanceMethod(objc_getClass("CContactMgr"), @selector(getSelfContact));
                IMP impGS = method_getImplementation(methodGetSelfContact);
                id selfContact = impGS(contactManager, @selector(getSelfContact));
                
                Ivar nsUsrNameIvar = class_getInstanceVariable([selfContact class], "m_nsUsrName");
                id m_nsUsrName = object_getIvar(selfContact, nsUsrNameIvar);
                BOOL isMesasgeFromMe = NO;
                BOOL isChatroom = NO;
                if ([m_nsFromUsr isEqualToString:m_nsUsrName]) {
                    isMesasgeFromMe = YES;
                }
                if ([m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound)
                {
                    isChatroom = YES;
                }
                if (isMesasgeFromMe /*&& kCloseRedEnvPluginForMyself == HBPliginType*/ && !isChatroom) {
                    //不抢自己的红包
                    break;
                }
                else if(isMesasgeFromMe /*&& kCloseRedEnvPluginForMyselfFromChatroom == HBPliginType*/ && isChatroom)
                {
                    //不抢群里自己的红包
                    break;
                }
                
                if ([m_nsContent rangeOfString:@"wxpay://"].location != NSNotFound)
                {
                    NSString *nativeUrl = m_nsContent;
                    NSRange rangeStart = [m_nsContent rangeOfString:@"wxpay://c2cbizmessagehandler/hongbao"];
                    if (rangeStart.location != NSNotFound)
                    {
                        NSUInteger locationStart = rangeStart.location;
                        nativeUrl = [nativeUrl substringFromIndex:locationStart];
                    }
                    
                    NSRange rangeEnd = [nativeUrl rangeOfString:@"]]"];
                    if (rangeEnd.location != NSNotFound)
                    {
                        NSUInteger locationEnd = rangeEnd.location;
                        nativeUrl = [nativeUrl substringToIndex:locationEnd];
                    }
                    
                    NSString *naUrl = [nativeUrl substringFromIndex:[@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length]];
                    
                    NSArray *parameterPairs =[naUrl componentsSeparatedByString:@"&"];
                    
                    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:[parameterPairs count]];
                    for (NSString *currentPair in parameterPairs) {
                        NSRange range = [currentPair rangeOfString:@"="];
                        if(range.location == NSNotFound)
                            continue;
                        NSString *key = [currentPair substringToIndex:range.location];
                        NSString *value =[currentPair substringFromIndex:range.location + 1];
                        [parameters setObject:value forKey:key];
                    }
                    
                    //红包参数
                    NSMutableDictionary *params = [@{} mutableCopy];
                    
                    [params setObject:parameters[@"msgtype"]?:@"null" forKey:@"msgType"];
                    [params setObject:parameters[@"sendid"]?:@"null" forKey:@"sendId"];
                    [params setObject:parameters[@"channelid"]?:@"null" forKey:@"channelId"];
                    
                    id getContactDisplayName = objc_msgSend(selfContact, @selector(getContactDisplayName));
                    id m_nsHeadImgUrl = objc_msgSend(selfContact, @selector(m_nsHeadImgUrl));
                    
                    [params setObject:getContactDisplayName forKey:@"nickName"];
                    [params setObject:m_nsHeadImgUrl forKey:@"headImg"];
                    [params setObject:[NSString stringWithFormat:@"%@", nativeUrl]?:@"null" forKey:@"nativeUrl"];
                    [params setObject:m_nsFromUsr?:@"null" forKey:@"sessionUserName"];
                    
                    if (1 /*kCloseRedEnvPlugin != HBPliginType*/) {
                      //  [NSThread sleepForTimeInterval:1];
                        
                        double delayInSeconds = arc4random() % 5 + 1;
                        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds*NSEC_PER_SEC));
                        
                        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                            //自动抢红包
                            ((void (*)(id, SEL, NSMutableDictionary*))objc_msgSend)(logicMgr, @selector(OpenRedEnvelopesRequest:), params);
                        });
                        
                        CMessageMgr* me = self;
                         delayInSeconds += arc4random() % 5 + 1;
                        popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds*NSEC_PER_SEC));
                        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                            //自动抢红包
                          NSString* sendMsg = @"么么哒/亲亲";
                        
                            objc_msgSend(me, @selector(sendTextMsgToUsr:text:), m_nsFromUsr,sendMsg);
                        });

                    }
                    return;
                }
                
                break;
        }
    }
    
}


%new
-(void) sendTextMsgToUsr:(NSString*)nsToUsr text:(NSString*)nsContent
{
    [nsToUsr retain];
    [nsContent retain];
    
    Method methodMMServiceCenter = class_getClassMethod(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
    IMP impMMSC = method_getImplementation(methodMMServiceCenter);
    id MMServiceCenter = impMMSC(objc_getClass("MMServiceCenter"), @selector(defaultCenter));
    
    //
    id sessionMgr = ((id (*)(id, SEL, Class))objc_msgSend)(MMServiceCenter, @selector(getService:),objc_getClass("MMNewSessionMgr"));

    
    uint32_t time = (uint32_t)objc_msgSend(sessionMgr, @selector(GenSendMsgTime));
    
    //红包控制器
    id tempChatMgr = ((id (*)(id, SEL, Class))objc_msgSend)(MMServiceCenter, @selector(getService:),objc_getClass("WCTempChatMgr"));

    
    
    id settingUtil = objc_getClass("SettingUtil");
    NSString* localUsrName = (NSString*)objc_msgSend(settingUtil, @selector(getLocalUsrName:), 0x3);
    if (!localUsrName) return;
    [localUsrName autorelease];


 
    Class messageWrapClass = objc_getClass("CMessageWrap");
    if (!messageWrapClass) return;
    id msgWrap = [messageWrapClass alloc];
    [msgWrap autorelease];
    objc_msgSend(msgWrap, @selector(initWithMsgType:), 0x2);
    objc_msgSend(msgWrap, @selector(setM_nsFromUsr:), localUsrName);
    objc_msgSend(msgWrap, @selector(setM_nsContent:), nsContent);
    objc_msgSend(msgWrap, @selector(setM_nsToUsr:), nsToUsr);
    objc_msgSend(msgWrap, @selector(setM_uiCreateTime:), time);
    objc_msgSend(msgWrap, @selector(setM_uiStatus), 0xc);
    int isTempChat = (int)objc_msgSend(tempChatMgr, @selector(isTempChatForUserName:), nsToUsr);
    if (isTempChat){
        objc_msgSend(msgWrap, @selector(setM_isTempSessionMsg:), 0x1);
    }
    
    [self AddMsg:(id)nsToUsr MsgWrap:(id)msgWrap];
   // WXLog(@"----------------------- begin");
    [nsContent release];
    [nsToUsr release];
}

%end


%ctor {
    if (checkPluginCanUse()){
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}


