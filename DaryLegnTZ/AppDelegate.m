//
//  AppDelegate.m
//  DaryLegnTZ
//
//  Created by Дарья Кравченко on 02.02.2018.
//  Copyright © 2018 Дарья Лень. All rights reserved.
//

#import "AppDelegate.h"
#import "VKSdk.h"

//#import "VKSdkFramework/VKSdkFramework.h"
//#import "VK_ios_sdk/VKSdk.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

-(BOOL) application:(UIApplication *)app openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation {
    
    [VKSdk processOpenURL:url fromApplication:sourceApplication];
        
    return YES;
}

@end
