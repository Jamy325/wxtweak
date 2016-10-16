
#include "wxUtil.h"


%hook WCAccountManualLoginControlMgr
- (void)reportADID { %log; %orig; }
- (void)scheduleLocalNotification:(id)arg1 { %log; %orig; }
- (void)scheduleLocalNotification:(id)arg1 fireDate:(id)arg2 { %log; %orig; }
- (_Bool)isRestTime:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)deleteArchive { %log; %orig; }
- (_Bool)recoverFromArchive { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)saveCurrentStatusToArchive { %log; %orig; }
- (unsigned long long)getReportTime { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (void)reportClickStream:(id)arg1 { %log; %orig; }
- (unsigned int)startInviteLogic:(id)arg1 Data:(id)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)startRegisterLogic:(id)arg1 Data:(id)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)startSecurityCenterLogic:(id)arg1 Data:(id)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)startFacebookLogic:(id)arg1 Data:(id)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)startPhoneLoginLogic:(id)arg1 Data:(id)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)startQRCodeLoginLogic:(id)arg1 Data:(id)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (unsigned int)startLoginLogic:(id)arg1 Data:(id)arg2 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
- (id)showAlertWithTitle:(id)arg1 message:(id)arg2 btnTitle:(id)arg3 target:(id)arg4 sel:(SEL)arg5 btnTitle:(id)arg6 target:(id)arg7 sel:(SEL)arg8 btnTitle:(id)arg9 target:(id)arg10 sel:(SEL)arg11 status:(unsigned int)arg12 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)showAlertWithTitle:(id)arg1 message:(id)arg2 btnTitle:(id)arg3 target:(id)arg4 sel:(SEL)arg5 btnTitle:(id)arg6 target:(id)arg7 sel:(SEL)arg8 status:(unsigned int)arg9 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)showAlertWithTitle:(id)arg1 message:(id)arg2 btnTitle:(id)arg3 target:(id)arg4 sel:(SEL)arg5 status:(unsigned int)arg6 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)dismissAlertView:(id)arg1 buttonIndex:(id)arg2 { %log; %orig; }
- (void)reportExitAlert:(id)arg1 { %log; %orig; }
- (void)reportEnterAlert:(id)arg1 { %log; %orig; }
- (void)reportClickAction:(unsigned int)arg1 { %log; %orig; }
- (void)reportClickAction:(unsigned int)arg1 styleID:(id)arg2 { %log; %orig; }
- (id)getStatusName:(unsigned int)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)closeFirstView { %log; %orig; }
- (void)openFirstView:(id)arg1 withNavBarHidden:(_Bool)arg2 { %log; %orig; }
- (void)openFirstView:(id)arg1 { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

%end


%ctor {
    if (checkPluginCanUse())
    {
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}
