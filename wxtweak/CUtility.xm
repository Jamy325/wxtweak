%hook CUtility
+ (int)getGeneralNetworkType { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)getWebpNetworkType { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)genWebpUrlWithOriUrl:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)isNeedUseWebpFormatUrl:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)getMatchFullPinYinText:(id)arg1 searchText:(id)arg2 dicPinYin:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)getMatchShortPinYinText:(id)arg1 searchText:(id)arg2 dicPinYin:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)hasPinYinPrefix:(id)arg1 searchText:(id)arg2 options:(unsigned long long)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isEnglishLetter:(unsigned short)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isTrailSurrogates:(unsigned short)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isLeadSurrogates:(unsigned short)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isValidWeChatID:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)containOnlyLetterOrDigit:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isNumber:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isEnglishWord:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)GetTelephonyNetWorkCountryCode { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetEmoticonLinkPid:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

+ (id)snapshotForUIView:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetKeyValueFromPB:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)dumpSqlString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)filterAllWhiteSpaceAndNewLineString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)filterWhiteSpaceAndNewLineString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)filterString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)trimString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetExcutablePath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (void)ClearAllWebViewCookies { %log; %orig; }
+ (void)UpdateUserAgent { %log; %orig; }
+ (void)SetDefaultUserAgent { %log; %orig; }
+ (id)GetUserAgentSuffix { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (int)imageTypeForImageData:(id)arg1 { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (void)ReportFailIPToNewDNS:(id)arg1 { %log; %orig; }
+ (id)DoNewDns:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)DoNewDns:(id)arg1 DnsType:(unsigned int *)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)DoDns:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetDNSServers { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)isGIFFile:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)DecodePack:(id)arg1 Output:(id)arg2 DESKey:(char *)arg3 KeyLen:(unsigned int)arg4 { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)SafeUnarchiveFromData:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)SafeUnarchive:(id)arg1 hasError:(_Bool *)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)SafeUnarchive:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

+ (id)getStringFromUrl:(id)arg1 needle:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)getDomainName:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)ReplaceClientVersion:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetMimeTypeByFileExt:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)getIconNameByFileExt:(id)arg1 iconSize:(int)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)getIconImageByFileExt:(id)arg1 iconSize:(int)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)UTF8HexToNSString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)NSStringToUTF8Hex:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)IsFacebookAuthName:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)SafeUtf8WithCString:(const char *)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)CheckSyncMediaNote:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)componentsSeparated:(id)arg1 byString:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)IsCurLanguageChineseTraditional { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)getCurSystemLanguage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)getSystemTimeZoneString { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)IsURLFromAppStore:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (unsigned int)getRegSrcVersionNum { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (id)stringOfFriendlySizeForApple:(double)arg1 maxFractionDigits:(unsigned long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)stringOfFriendlySize:(double)arg1 maxFractionDigits:(unsigned long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)SyncBufferToString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)MergeSyncBuffer:(id)arg1 NewBuffer:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)IntToIPString:(unsigned int)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (unsigned int)IPStringToInt:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (_Bool)NeedNewSync:(unsigned int)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (unsigned long long)genCurrentTimeInMsFrom1970 { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
+ (unsigned long long)genCurrentTimeInMs { %log; unsigned long long r = %orig; HBLogDebug(@" = %llu", r); return r; }
+ (unsigned int)genCurrentTime { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (unsigned int)ChatNotifyC2S:(unsigned int)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (unsigned int)ChatNotifyS2C:(unsigned int)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (unsigned int)CheckUsrNameType:(id)arg1 { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (_Bool)isEnterpriseSingleUsrName:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isEnterpriseUsrName:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)ReplaceSingleQuote:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)ReplaceInvalidChar:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)is64BitEnvironment { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (void)PrintClientInfo { %log; %orig; }
+ (id)ParseFullVersionString:(unsigned int)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)ParseVersionString:(unsigned int)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (void)ParseVersion:(unsigned int)arg1 Major:(unsigned int *)arg2 Minor:(unsigned int *)arg3 Minorex:(unsigned int *)arg4 { %log; %orig; }
+ (unsigned int)GetVersion { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (id)DecodeWithBase64:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)EncodeWithBase64:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)DecodeBase64:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)NsDataEncodeBase64:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)EncodeBase64:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetSystemCachePath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetLibraryCachePath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetTmpPath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetDocPath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfLocationCache { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfLocationThumb { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfURLCache { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfTempEmoticon:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetDownloadPathOfEmoticonPackage:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetThumbPathOfEmoticon:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfEmoticon:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfTempPackage:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetThumbPathOfPackage:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfPackage:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMassShortVideoDir:(id)arg1 andVideoName:(id)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfTempCacheVideo { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetClientIDOfMsg:(id)arg1 LocalID:(unsigned int)arg2 Time:(unsigned int)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesVideoDir:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesVideoThumb:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetTempPathOfMesShortVideo:(id)arg1 n64SvrID:(long long)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesVideo:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesVideoDir:(id)arg1 DocPath:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfWebMesAudioTrans:(id)arg1 LocalID:(id)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesAudioTrans:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesAudioDir:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesAudio:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesAudioDir:(id)arg1 DocPath:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesSettingDir { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesImgDir:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfDraftUsrDir { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesHDImgTemp:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesImgTemp:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfSquareMesImgThumb:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMaskedMesImgThumb:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesImgThumb:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesHDImg:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesImg:(id)arg1 LocalID:(unsigned int)arg2 DocPath:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfMesImgDir:(id)arg1 DocPath:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfProductItem:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfProductDetail { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeBkgUp { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeBeaconStorage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeBeaconStoragePB { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeTvMsgStorage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeTvStorage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeTvStoragePB { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeMusicStorage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeMusicStoragePB { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeShareStorage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakePageStoragePB { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakePageStorage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfSHakePeopleStorage { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakePeopleStoragePB { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetUserAlbumRootDir { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetRandomPathOfTrash { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetRootPathOfTrash { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfWCRedEnvelopesBaseFile { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfWCPayBaseFile { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfWCMallBaseFile { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfWCAddressBaseFile { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfBakChat { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeBgImg { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfShakeBgImgTmp:(unsigned int)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfUsrShakeImg:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfCacheLocalUsrDir { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfLocalUsrDir { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (void)SetPathOfLocalUsrDir { %log; %orig; }
+ (id)GetPathOfLocalUsrDirAsync { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfUsrWCBKSetting { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetPathOfUsrChatBKSetting { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

+ (void)SetLocalUsrNameMD5:(id)arg1 { %log; %orig; }
+ (id)GetHttpEndData { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (char *)NewStrFromNSStr:(id)arg1 { %log; char * r = %orig; HBLogDebug(@" = %s", r); return r; }
+ (id)GetRandomMD5 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (unsigned int)GenSeq { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (unsigned int)GenID { %log; unsigned int r = %orig; HBLogDebug(@" = %u", r); return r; }
+ (long long)GetNetWorkReachable { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
+ (id)GetRandomKeyWithSalt:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetRandomKey { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)GetRandomUUID { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (void)Initial { %log; %orig; }
+ (id)GetUUIDNew { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (_Bool)SetDoNotBackupForPath:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (id)hashForString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)hashPathForString:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end
