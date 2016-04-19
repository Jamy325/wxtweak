//
//  wxUtil.h
//  wxtweak
//
//  Created by Jamy on 16-4-19.
//
//
#import <CommonCrypto/CommonDigest.h>

#ifndef wxtweak_wxUtil_h
#define wxtweak_wxUtil_h



NSString* md5HexDigest(NSString* input)
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%x", result[i]];
    }
    return ret;
}

#endif
