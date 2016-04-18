%hook DeviceInfo
+ (id)deviceXml
 {
        %log; 
        id r = %orig; 
        HBLogDebug(@" = %@", r); 

        return @"<softtype><k3>7.1.2</k3><k9>iPhone</k9><k10>2</k10><k19>3AC5421B-A9EE-434D-A7D5-EC41F70CD133</k19><k20>F9306C17-207B-498B-B394-6B98BA69069A</k20><k21>jetfire</k21><k22>中国移动</k22><k24>52:bd:5f:53:a6:3c</k24><k33>微信</k33><k47>1</k47><k50>0</k50><k51>com.tencent.xin</k51></softtype>";
}


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
