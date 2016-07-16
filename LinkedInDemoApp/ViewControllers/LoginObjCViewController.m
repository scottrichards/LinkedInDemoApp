//
//  LoginObjCViewController.m
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/16/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

#import "LoginObjCViewController.h"
#import <linkedin-sdk/LISDK.h>

@interface LoginObjCViewController ()
@property (nonatomic,strong) NSError *lastError;
@end

@implementation LoginObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSignIn:(id)sender {
    NSLog(@"%s","sync pressed2");
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
//                                      [self updateControlsWithResponseLabel:NO];
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                        NSLog(@"%s %@","error called! ", [error description]);
                                        self.lastError = error;
                                        //  _responseLabel.text = [error description];
 //                                       [self updateControlsWithResponseLabel:YES];
                                    }
     ];
    NSLog(@"%s","sync pressed3");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
