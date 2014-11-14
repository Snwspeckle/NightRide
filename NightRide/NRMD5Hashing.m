//
//  NRMD5Hashing.m
//  NightRide
//
//  Created by Anthony on 1/28/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import "NRMD5Hashing.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NRMD5Hashing

// MD5 Hashing Function
+ (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}


@end
