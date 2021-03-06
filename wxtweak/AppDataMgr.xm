#include "wxUtil.h"


%hook AppDataMgr
- (void)setAppSettingMap:(NSMutableDictionary *)appSettingMap { %log; %orig; }
- (NSMutableDictionary *)appSettingMap { %log; NSMutableDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (void)onServiceReloadData { %log; %orig; }
- (void)onPreQuit { %log; %orig; }
- (void)MessageReturn:(id)arg1 Event:(unsigned int)arg2 { %log; %orig; }
- (_Bool)structCGI:(id)arg1 withType:(unsigned int)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)updateAppSettingItemList:(id)arg1 { %log; %orig; }
- (_Bool)makeUrlRequst:(id)arg1 userData:(id)arg2 cdn:(_Bool)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)handleGetWatermark:(id)arg1 { %log; %orig; }
- (void)handleGetIcon:(id)arg1 { %log; %orig; }
- (void)handleGetAppInfoList:(id)arg1 { %log; %orig; }
- (id)updateValue:(id)arg1 newValue:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)updateAppWatermark:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)updateAppIcon:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)updateAppInfo:(id)arg1 { %log; %orig; }
- (id)getInstalledAppInfo:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)checkAndSaveIcon:(id)arg1 appID:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)checkRegisterInfo:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)refreshAppInfoLastUpdateTimeForNewUser { %log; %orig; }
- (_Bool)loadAppRegisterInfo { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)trimAppRegisterInfo:(id)arg1 { %log; %orig; }
- (void)saveAppRegisterInfo { %log; %orig; }
- (id)getRegisterDictionary { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)dictionaryToAppRegisterInfo:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getRegisterPasteboardName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetPathOfAppWatermark:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)GetPathOfAppIcon:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)setSDKVersion { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)saveAppPersonalInfo { %log; %orig; }
- (_Bool)loadAppPersonalInfo { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)saveAuthAppInfo { %log; %orig; }
- (_Bool)loadAuthAppInfo { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getPersonalInfoWithAppID:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)handleGetAppPersonalInfoList:(id)arg1 { %log; %orig; }
- (void)handleGetAuthAppList:(id)arg1 { %log; %orig; }
- (id)getAuthAppList { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)filterUnInstalledApp { %log; %orig; }
- (_Bool)UpdateAuthAppList:(int)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)removeAppByUser:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)addAppByUser:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)addNeedUpdateAppId:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)addInstalledAppList:(id)arg1 { %log; %orig; }
- (_Bool)forceUpdateBizAppInfo:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)forceUpdateBizAppInfoWithAppIDList:(id)arg1 { %log; %orig; }
- (void)forceUpdateAppInfo:(id)arg1 { %log; %orig; }
- (void)updateAppInfo:(id)arg1 appInfoVer:(unsigned int)arg2 isForceUpdate:(_Bool)arg3 { %log; %orig; }
- (void)clearGetAppInfoListRunningQueue { %log; %orig; }
- (void)checkGetAppInfoListWaitingQueue { %log; %orig; }
- (void)addGetAppInfoListQueue:(id)arg1 { %log; %orig; }
- (_Bool)checkUpdateAppIconWaitingQueue { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)addUpdateAppIconQueue:(id)arg1 appID:(id)arg2 cmd:(id)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)updateAppTypeList:(id)arg1 appTypeList:(id)arg2 { %log; %orig; }
- (void)updateBizAppInfoWithGameCenter { %log; %orig; }
- (void)updateBizAppInfoWithAddByUser { %log; %orig; }
- (id)getAppRegisterInfo:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)mergeBuiltInAppInfo:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)mergeValue:(id)arg1 newValue:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)compareAppID:(id)arg1 withOtherAppID:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getAppWatermark:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getServiceAppIcon:(id)arg1 IconUrl:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getRecommendAppIcon:(id)arg1 IconUrl:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getAppIcon:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)receiveAppInfoFromMsg:(id)arg1 name:(id)arg2 version:(int)arg3 isForceUpdate:(_Bool)arg4 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getShowGameCenterArray { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getGameInstalledArray { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)deleteUninstalledGameApp:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isAppInstalledPossibly:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getAppInstalledArray { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setServiceAppNotShowNew:(id)arg1 { %log; %orig; }
- (id)getAttachmentViewServiceAppsList:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getServiceAppArray:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)clearRecommentAppArray { %log; %orig; }
- (void)setRecommendAppNotShowNew:(id)arg1 { %log; %orig; }
- (void)updateRecommendAppArray { %log; %orig; }
- (id)getRecommendAppArray { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)getGeneralAppInstalledArray { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)addInstalledAppInfoByAppID:(id)arg1 appName:(id)arg2 appIconUrl:(id)arg3 { %log; %orig; }
- (void)addAppByUserMoveToAppSetting { %log; %orig; }
- (_Bool)isAppDataChecked { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)checkAndUpdateAppData { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)checkAndUpdateAppDataForiOS7Plus:(id)arg1 forceUpdate:(_Bool)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)saveAppSetting { %log; %orig; }
- (_Bool)loadAppSetting { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)handleSetAppSetting:(id)arg1 { %log; %orig; }
- (void)handleGetAppSetting:(id)arg1 { %log; %orig; }
- (_Bool)SetAppSetting:(id)arg1 setCmdID:(int)arg2 setCmdValue:(id)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)UpdateAppPersonalInfoList:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)UpdateBatchAppSettingItem:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)onAuthOK { %log; %orig; }
- (void)doUpdateAppSettingItem { %log; %orig; }
- (void)setAppSettingFlag:(unsigned int)arg1 withAppID:(id)arg2 { %log; %orig; }
- (void)UpdateAppRecvMsgState:(id)arg1 isRecvMsg:(_Bool)arg2 { %log; %orig; }
- (void)UpdateAppAuthState:(id)arg1 isAuth:(_Bool)arg2 { %log; %orig; }
- (_Bool)UpdateAppSettingItem:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)updateAppAddedByUser:(id)arg1:(_Bool)arg2 { %log; %orig; }
- (void)updateAppSettingFlag:(id)arg1 { %log; %orig; }
- (_Bool)isGeneralApp:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isGame:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isNeedDetectRequetURL:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isCanForward:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isAppAddedByUser:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)getOpenID:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isOpenIDExist:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isRecvMsg:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isAppSettingExist:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)loadNewAppStatus { %log; %orig; }
- (void)saveNewAppStatus { %log; %orig; }
- (void)setNewAppStatus:(_Bool)arg1 { %log; %orig; }
- (_Bool)getNewAppStatus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)writeToFile:(id)arg1 data:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)mergeBuiltInAppList { %log; %orig; }
- (id)getAppIdWithFuncType:(int)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (int)getFuncTypeWithAppId:(id)arg1 { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)initInnerJumpDict { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end


%ctor {
    if (checkPluginCanUse()){
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}




