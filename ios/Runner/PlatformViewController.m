// Copyright 2017, the Flutter project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#import <Foundation/Foundation.h>
#import "PlatformViewController.h"

static NSArray *SCOPE = nil;

@interface PlatformViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *incrementLabel;
@end

@implementation PlatformViewController

- (void)viewDidLoad {
    SCOPE = @[VK_PER_PHOTOS, VK_PER_EMAIL];
    [super viewDidLoad];
    [self setIncrementLabelText];
    
}

- (IBAction)handleIncrement:(id)sender {
    self.counter++;
    [self setIncrementLabelText];
}

- (IBAction)switchToFlutterView:(id)sender {
    //    [self.delegate didUpdateCounter:self.counter];
    //    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"Fuck that shit");
    [[VKSdk initializeWithAppId:@"******"] registerDelegate:self];
    [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
        NSLog(@"1111--\n VKAuthorizationAuthorized \n --");
        if (state == VKAuthorizationAuthorized) {
            NSLog(@"--\n VKAuthorizationAuthorized \n --");
        } else if (error) {
            
        }
    }];
}

- (void)setIncrementLabelText {
    NSString* text = [NSString stringWithFormat:@"Button tapped %d %@.",
                      self.counter,
                      (self.counter == 1) ? @"time" : @"times"];
    self.incrementLabel.text = text;
}

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
}


- (void)vkSdkUserAuthorizationFailed {
    
}

@end



