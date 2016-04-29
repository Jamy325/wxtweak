
#include "wxUtil.h"

%hook DeviceInfo
+ (id)deviceXml
 {
        %log; 
        NSString* r = %orig;
        HBLogDebug(@" = %@", r);
        NSString* md5 = md5HexDigest(r);
        md5 = md5HexDigest(md5);
        md5 = [md5 uppercaseString];
        NSLog(@"md5:%@", md5);
     
     const char * a =[md5 UTF8String];
     
     NSString* identifierForVendorUUID_k19 =
     [NSString stringWithFormat:@"%c%c%c%c%c%c%c%c-%c%c%c%c-%c%c%c%c-%c%c%c%c-%c%c%c%c%c%c%c%c%c%c%c%c",
      a[1], a[3], a[24],a[25], a[4], a[11],a[8], a[1], a[24],a[10], a[12], a[22],a[10], a[14], a[3], a[4],
      a[11], a[6], a[4],a[5], a[0], a[1],a[8], a[1], a[14],a[10], a[22], a[22],a[20], a[4], a[13], a[24] ];
     
     NSString* aduuidString_k20 =
     [NSString stringWithFormat:@"%c%c%c%c%c%c%c%c-%c%c%c%c-%c%c%c%c-%c%c%c%c-%c%c%c%c%c%c%c%c%c%c%c%c",
      a[2], a[4], a[6],a[8], a[10], a[12],a[14], a[16], a[18],a[20], a[22], a[24],a[26], a[28], a[20], a[21],
      a[0], a[1], a[3],a[5], a[7], a[9],a[11], a[13], a[15],a[17], a[19], a[21],a[23], a[25], a[27], a[5] ];
     
     NSString* wifiname_k21 =
     [NSString stringWithFormat:@"TPLINK-%c%c%c%c%c%c%c%c",
      a[5], a[7], a[5],a[4], a[1], a[2],a[3], a[16]];
     
     
     NSString* carrierName_k22 = @"中国移动";
     NSString* macaddress_k24 = @"02:00:00:00:00:00";
     NSString* bundleDisplayName_k33 = @"微信";
     int NetType_k47 = 1;
     int isJailBreak_k50 = 0;
     NSString* bundleIdentifier_k51 = @"com.tencent.xin";
     
     
     NSString* format = @"<softtype><k3>%@</k3><k9>%@</k9><k10>%d</k10><k19>%@</k19><k20>%@</k20><k21>%@</k21><k22>%@</k22><k24>%@</k24><k33>%@</k33><k47>%u</k47><k50>%d</k50><k51>%@</k51></softtype>";
     NSString* str =  [NSString stringWithFormat:format, @"9.3.1", @"iPhone", 2,  identifierForVendorUUID_k19, aduuidString_k20,wifiname_k21, carrierName_k22, macaddress_k24, bundleDisplayName_k33, NetType_k47, isJailBreak_k50, bundleIdentifier_k51];
     NSLog(@"change to :%@", str);
        return str;
}

/*

+ (_Bool)hasForceTouchCapability:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone6Screen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone6pScreen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)is736hScreen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)is667hScreen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)is568hScreen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)is480hScreen { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS5plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS5_1plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS6plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS6_1plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS7Below { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS7 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS7plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS7_1plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS9plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS8plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS8_1plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS8_2plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS8_3plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiOS8_4plus { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isUnderiPhone4s { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isLowPerformanceDevice { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPadUniversal { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPadMini { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPad4 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPad3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPad2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPad1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPad { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPodTouch5 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPodTouch4 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPodTouch3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPodTouch2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPodTouch1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPodTouch { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone6p { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone6 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone5C { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone5S { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone5 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone4S { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone4 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone3GS { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone3G { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone2G { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (_Bool)isiPhone { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
*/
+ (double)FreeDiskSpaceSize { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
+ (double)TotalDiskSpaceSize { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
+ (id)DCache { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)DBus { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)DMemory { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)DCPU { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)DSystem { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)DModel { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)modelPlatform { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end



%ctor {
    if (checkPluginCanUse())
    {
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}


