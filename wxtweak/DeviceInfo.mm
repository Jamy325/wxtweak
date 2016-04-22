#line 1 "/Users/jamy/works/wxtweak/wxtweak/DeviceInfo.xm"

#include "wxUtil.h"

#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

#include <substrate.h>
@class DeviceInfo; 
static id (*_logos_meta_orig$_ungrouped$DeviceInfo$deviceXml)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DeviceInfo$deviceXml(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$DeviceInfo$FreeDiskSpaceSize)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$DeviceInfo$FreeDiskSpaceSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$DeviceInfo$TotalDiskSpaceSize)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$DeviceInfo$TotalDiskSpaceSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$DeviceInfo$DCache)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DeviceInfo$DCache(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$DeviceInfo$DBus)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DeviceInfo$DBus(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$DeviceInfo$DMemory)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DeviceInfo$DMemory(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$DeviceInfo$DCPU)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DeviceInfo$DCPU(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$DeviceInfo$DSystem)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DeviceInfo$DSystem(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$DeviceInfo$DModel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DeviceInfo$DModel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$DeviceInfo$modelPlatform)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DeviceInfo$modelPlatform(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); 

#line 4 "/Users/jamy/works/wxtweak/wxtweak/DeviceInfo.xm"


static id _logos_meta_method$_ungrouped$DeviceInfo$deviceXml(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) {
        HBLogDebug(@"+[<DeviceInfo: %p> deviceXml]", self); 
        NSString* r = _logos_meta_orig$_ungrouped$DeviceInfo$deviceXml(self, _cmd);
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



















































static double _logos_meta_method$_ungrouped$DeviceInfo$FreeDiskSpaceSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> FreeDiskSpaceSize]", self); double r = _logos_meta_orig$_ungrouped$DeviceInfo$FreeDiskSpaceSize(self, _cmd); HBLogDebug(@" = %f", r); return r; }
static double _logos_meta_method$_ungrouped$DeviceInfo$TotalDiskSpaceSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> TotalDiskSpaceSize]", self); double r = _logos_meta_orig$_ungrouped$DeviceInfo$TotalDiskSpaceSize(self, _cmd); HBLogDebug(@" = %f", r); return r; }
static id _logos_meta_method$_ungrouped$DeviceInfo$DCache(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> DCache]", self); id r = _logos_meta_orig$_ungrouped$DeviceInfo$DCache(self, _cmd); HBLogDebug(@" = %@", r); return r; }
static id _logos_meta_method$_ungrouped$DeviceInfo$DBus(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> DBus]", self); id r = _logos_meta_orig$_ungrouped$DeviceInfo$DBus(self, _cmd); HBLogDebug(@" = %@", r); return r; }
static id _logos_meta_method$_ungrouped$DeviceInfo$DMemory(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> DMemory]", self); id r = _logos_meta_orig$_ungrouped$DeviceInfo$DMemory(self, _cmd); HBLogDebug(@" = %@", r); return r; }
static id _logos_meta_method$_ungrouped$DeviceInfo$DCPU(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> DCPU]", self); id r = _logos_meta_orig$_ungrouped$DeviceInfo$DCPU(self, _cmd); HBLogDebug(@" = %@", r); return r; }
static id _logos_meta_method$_ungrouped$DeviceInfo$DSystem(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> DSystem]", self); id r = _logos_meta_orig$_ungrouped$DeviceInfo$DSystem(self, _cmd); HBLogDebug(@" = %@", r); return r; }
static id _logos_meta_method$_ungrouped$DeviceInfo$DModel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> DModel]", self); id r = _logos_meta_orig$_ungrouped$DeviceInfo$DModel(self, _cmd); HBLogDebug(@" = %@", r); return r; }
static id _logos_meta_method$_ungrouped$DeviceInfo$modelPlatform(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST self, SEL _cmd) { HBLogDebug(@"+[<DeviceInfo: %p> modelPlatform]", self); id r = _logos_meta_orig$_ungrouped$DeviceInfo$modelPlatform(self, _cmd); HBLogDebug(@" = %@", r); return r; }

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$DeviceInfo = objc_getClass("DeviceInfo"); Class _logos_metaclass$_ungrouped$DeviceInfo = object_getClass(_logos_class$_ungrouped$DeviceInfo); if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(deviceXml), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$deviceXml, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$deviceXml);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(FreeDiskSpaceSize), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$FreeDiskSpaceSize, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$FreeDiskSpaceSize);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(TotalDiskSpaceSize), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$TotalDiskSpaceSize, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$TotalDiskSpaceSize);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(DCache), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$DCache, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$DCache);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(DBus), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$DBus, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$DBus);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(DMemory), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$DMemory, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$DMemory);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(DCPU), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$DCPU, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$DCPU);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(DSystem), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$DSystem, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$DSystem);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(DModel), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$DModel, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$DModel);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}if (_logos_metaclass$_ungrouped$DeviceInfo) {MSHookMessageEx(_logos_metaclass$_ungrouped$DeviceInfo, @selector(modelPlatform), (IMP)&_logos_meta_method$_ungrouped$DeviceInfo$modelPlatform, (IMP*)&_logos_meta_orig$_ungrouped$DeviceInfo$modelPlatform);} else {HBLogError(@"logos: nil class %s", "DeviceInfo");}} }
#line 106 "/Users/jamy/works/wxtweak/wxtweak/DeviceInfo.xm"
