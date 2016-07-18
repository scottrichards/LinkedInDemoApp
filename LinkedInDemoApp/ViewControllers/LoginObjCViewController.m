//
//  LoginObjCViewController.m
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/16/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

#import "LoginObjCViewController.h"
#import <linkedin-sdk/LISDK.h>
#import "LinkedInBridge.h"

@interface LoginObjCViewController ()
@property (nonatomic,strong) NSError *lastError;
@property (nonatomic, strong) LinkedInBridge *linkedInBridge;
@end

@implementation LoginObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.linkedInBridge = [[LinkedInBridge alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSignIn:(id)sender {
    NSLog(@"%s","sync pressed2");
    [_linkedInBridge createSessionWithCompletion:^(NSString *returnState){
        NSLog(@"Completed new State: %@",returnState);
        [self performSegueWithIdentifier:@"segueToTab" sender:self];
    }error:^(NSError *error) {
        _lastError = error;
        NSLog(@"ERROR Logging in: %@",error.description);
    }];
    
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
