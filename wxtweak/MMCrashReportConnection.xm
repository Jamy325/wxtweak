#include "wxUtil.h"


%hook MMCrashReportConnection
- (void)ReportTimeOut { %log; %orig; }
- (void)connectionDidFinishLoading:(id)arg1 { %log; }
- (void)connection:(id)arg1 didFailWithError:(id)arg2 { %log;  }
- (void)connection:(id)arg1 didReceiveData:(id)arg2 { %log;  }
- (void)connection:(id)arg1 didReceiveResponse:(id)arg2 { %log; }
- (void)connection:(id)arg1 didSendBodyData:(long long)arg2 totalBytesWritten:(long long)arg3 totalBytesExpectedToWrite:(long long)arg4 
{
    %log;
}
- (void)connection:(id)arg1 didReceiveAuthenticationChallenge:(id)arg2 { %log; %orig; }
- (_Bool)connection:(id)arg1 canAuthenticateAgainstProtectionSpace:(id)arg2
 {
    %log;
    WXLog(@"CrashReporterConnection connect force set fail");
    return YES;
}
- (_Bool)Connect 
{ 
    %log;
    WXLog(@"CrashReporterConnection connect force set fail");
    return YES;
}


- (_Bool)uploadCrash:(id)arg1 reportType:(int)arg2 
{
    %log;
    //_Bool r = %orig;
    //HBLogDebug(@" = %d", r);
        WXLog(@"uploadCrash init force cancel");
    return YES;
 }

- (void)CancelUrlConnection { %log; %orig; }

- (id)init
 {
    %log;
    WXLog(@"CrashReporterConnection init force set fail");
    return 0;   
}
%end

%ctor {
    if (checkPluginCanUse()){
        %init;
    }
    //    [[iToast makeText:NSLocalizedString(@"The activity has been successfully saved.", @"")] show];
}