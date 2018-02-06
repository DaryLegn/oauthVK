//
//  ViewController.m
//  DaryLegnTZ
//
//  Created by Дарья Кравченко on 02.02.2018.
//  Copyright © 2018 Дарья Лень. All rights reserved.
//

#import "ViewController.h"
#import "VKSdk.h"

static NSString const *SEQUE_AUTHORISED = @"AUTHORISED";
static NSArray *SCOPE  = nil;

@interface ViewController () <VKSdkUIDelegate, VKSdkDelegate>

@property (weak, nonatomic) IBOutlet UILabel *oauthState;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *APP_ID = @"6358478";
    [[VKSdk initializeWithAppId:APP_ID] registerDelegate:self];
    [[VKSdk instance] setUiDelegate:self];
    
    [VKSdk wakeUpSession:SCOPE completeBlock: ^(VKAuthorizationState state, NSError *error ){
        
    }];
}

- (IBAction)authVKButton:(UIButton *)sender {
    
    SCOPE = @[VK_PER_FRIENDS, VK_PER_EMAIL];
    [VKSdk authorize:SCOPE];
}
- (void) startWork {
    
    [self performSegueWithIdentifier:SEQUE_AUTHORISED sender: self];
    
}

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    
    if (result.token) {
        self.oauthState.text = @"autorized";
        [self startWork];
    } else {
        self.oauthState.text = @"No autorized";
    }
    
}
- (void)vkSdkUserAuthorizationFailed {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void) vkSdkShouldPresentViewController:(UIViewController *)controller {
    
    [self.navigationController.topViewController presentViewController:controller animated:YES completion:nil];
    
}

- (void) vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    
    VKCaptchaViewController *vc =[VKCaptchaViewController captchaControllerWithError:captchaError];
    [vc presentIn:self.navigationController];
}

@end
