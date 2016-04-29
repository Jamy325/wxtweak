#include "wxUtil.h"


%hook WCAppInfo
- (void)setIsForceUpdate:(_Bool )isForceUpdate { %log; %orig; }
- (_Bool )isForceUpdate { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setFromUrl:(NSString *)fromUrl { %log; %orig; }
- (NSString *)fromUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setInstallUrl:(NSString *)installUrl { %log; %orig; }
- (NSString *)installUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setVersion:(NSString *)version { %log; %orig; }
- (NSString *)version { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setAppName:(NSString *)appName { %log; %orig; }
- (NSString *)appName { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setAppID:(NSString *)appID { %log; %orig; }
- (NSString *)appID { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isValid { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)initWithCoder:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)encodeWithCoder:(id)arg1 { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end


%ctor {
    if (checkPluginCanUse())
    {
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}