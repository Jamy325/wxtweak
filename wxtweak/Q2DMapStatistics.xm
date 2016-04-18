%hook Q2DMapStatistics
+ (id)sharedStatistics { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)sendingStatisticsToServer { %log; }
- (void)sendingRequest:(id)arg1 { %log; %orig; }
- (id)constructRequest { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)constructURLStringWithArguments:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)constructArguments { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)DPI { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)netType { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)appVersion { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)appName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)deviceIdentifier { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)throwKeyInvalidException { %log; %orig; }
%end
