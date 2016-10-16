
#include "wxUtil.h"
#import <objc/runtime.h>


%hook UIDevice
- (id)Q2DMapUniqueGlobalDeviceIdentifier 
{
    %log;

   id r = %orig; 
   HBLogDebug(@" = %@", r); 
   return r;    
}


- (id)Q2DMapUniqueDeviceIdentifier { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)macaddress { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end



%ctor {
    if (checkPluginCanUse())
    {
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}
