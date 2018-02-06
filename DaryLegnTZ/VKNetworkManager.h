//
//  VKNetworkManager.h
//  DaryLegnTZ
//
//  Created by Дарья Кравченко on 04.02.2018.
//  Copyright © 2018 Дарья Лень. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"

typedef void (^RequestCompletionBlock)(id responseObject, NSError *error);
typedef void (^FriendsFromVK)(NSArray* responseArray, NSError *error);

static NSUInteger const count = 50;
static NSInteger const offset = 10;

@interface VKNetworkManager : NSObject

@property (nonatomic, strong)  AFHTTPSessionManager *manager;

+ (VKNetworkManager*) sharedManager;

- (void)loadGETRequest:(NSString *)urlString requestCompletion:(RequestCompletionBlock)completion;

@end
