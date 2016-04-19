//
//  wxUtil.h
//  wxtweak
//
//  Created by Jamy on 16-4-19.
//
//
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

#ifndef wxtweak_wxUtil_h
#define wxtweak_wxUtil_h

    NSString* md5HexDigest(NSString* input);
    void UncaughtExceptionHandler(NSException* exception);
    void redirectNSLogToDocumentFolder();

#endif
