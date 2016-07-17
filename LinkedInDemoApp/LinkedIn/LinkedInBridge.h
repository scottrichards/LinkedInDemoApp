//
//  LinkedInBridge.h
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/16/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedInBridge : NSObject
- (void) createSessionWithCompletion:(void (^)(NSString *))completionBlock error:(void (^)(NSError *))error;
- (void) apiRequestWithEndPoint:(NSString *)endPoint onSuccess:(void (^)(NSString *))onSuccess onError:(void (^)(NSString *))onError;
@end
