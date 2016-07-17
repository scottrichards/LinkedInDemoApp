//
//  LinkedInBridge.m
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/16/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

#import "LinkedInBridge.h"

#import <linkedin-sdk/LISDK.h>

@interface LinkedInBridge ()
@property (nonatomic,strong) NSError *lastError;
@end

@implementation LinkedInBridge


// create a linked in session callback completionBlock on success with returnState or onError on failure with an NSError
- (void) createSessionWithCompletion:(void (^)(NSString *))completionBlock error:(void (^)(NSError *))onError {
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
                                         state:@"some state"
                        showGoToAppStoreDialog:YES
                                  successBlock:^(NSString *returnState) {
                                      
                                      NSLog(@"%s","success called!");
                                      LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                      NSLog(@"value=%@ isvalid=%@",[session value],[session isValid] ? @"YES" : @"NO");
                                      NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                      [text appendString:[NSString stringWithFormat:@",state=\"%@\"",returnState]];
                                      NSLog(@"Response label text %@",text);
                                      //                                     _responseLabel.text = text;
                                      self.lastError = nil;
                                      // retain cycle here?
                                      completionBlock(returnState);
                                      //                                      [self updateControlsWithResponseLabel:NO];
 //                                     [self performSegueWithIdentifier:@"segueToTab" sender:self];
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                        NSLog(@"%s %@","error called! ", [error description]);
                                        self.lastError = error;
                                        onError(error);
                                        //  _responseLabel.text = [error description];
                                        //                                       [self updateControlsWithResponseLabel:YES];
                                        
                                    }
     ];

}

- (void) apiRequestWithEndPoint:(NSString *)endPoint onSuccess:(void (^)(NSString *))onSuccess onError:(void (^)(NSString *))onError
{
    [self apiRequestWithEndPoint:endPoint method:@"GET" body:nil onSuccess:onSuccess onError:onError];
}

- (void) apiRequestWithEndPoint:(NSString *)endPoint method:(NSString *)method body:(NSString *)body onSuccess:(void (^)(NSString *))onSuccess onError:(void (^)(NSString *))onError
{
    NSLog(@"execute called with %@ method: %@ and body: %@", endPoint, method, body);
    // save state when request was made
    [[LISDKAPIHelper sharedInstance] apiRequest:endPoint
                                         method:method
                                           body:[body dataUsingEncoding:NSUTF8StringEncoding]
                                        success:^(LISDKAPIResponse *response) {
                                            NSLog(@"success called %@", response.data);
                                            onSuccess(response.data);
                                        }
                                          error:^(LISDKAPIError *apiError) {
                                              NSLog(@"error called %@", apiError.description);
                                            
    }];

}

@end
