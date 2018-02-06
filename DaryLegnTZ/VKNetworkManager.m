//
//  VKNetworkManager.m
//  DaryLegnTZ
//
//  Created by Дарья Кравченко on 04.02.2018.
//  Copyright © 2018 Дарья Лень. All rights reserved.
//

#import "VKNetworkManager.h"
static NSString *baseVKURL = @"https://api.vk.com/method/";
static NSString *VKURL = @"friends.get";


@implementation VKNetworkManager

+ (VKNetworkManager*) sharedManager {
    
    static VKNetworkManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[VKNetworkManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (void)loadGETRequest:(NSString *)urlString requestCompletion:(RequestCompletionBlock)completion{

    NSDictionary*params = [NSDictionary dictionaryWithObjectsAndKeys:
     @"138409534",   @"user_id",
     @"name",       @"order",
    @(count),      @"count",
     @(offset),    @"offset",
     @"photo_50",   @"fields",
     @"nom",       @"name_case", nil];
    

    
    [self.manager GET:[NSString stringWithFormat:@"%@%@", baseVKURL,VKURL] parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask *operation, NSArray *responseObject) {
        if(completion){
            
            completion(responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil,error);
        }
    }];
}

@end
