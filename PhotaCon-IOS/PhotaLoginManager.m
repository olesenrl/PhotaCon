//
//  PhotaLoginManager.m
//  PhotaCon-IOS
//
//  Created by chenghao lin on 1/5/13.
//  Copyright (c) 2013 billionaire. All rights reserved.
//

#import "PhotaLoginManager.h"
#import "PhotaServerProxy.h"
#import "PhotaFacebookApp.h"

@interface PhotaLoginManager()
@end

static PhotaLoginManager *sharedLoginManager = nil;


@implementation PhotaLoginManager
@synthesize isLogin = _isLogin;
/*
-(void)loginUser:(NSString *)userName
    withPassword:(NSString *)password
        callback:(void (^)(BOOL))callback{
    [[PhotaServerProxy sharedInstance] loginUser:userName withPassword:password callback:^(BOOL status, id Result, NSError *error) {
        if (status) {
            NSLog(@"LoginManager user logged in:%@",Result);
            self.isLogin = YES;
        }else{
            NSLog(@"LoginManager user NOT logged in - Result:%@ Error:%@",Result,error);
        }
        callback(self.isLogin);
    }];
}
 
-(void)registerUser:(NSString *)userName
       withPassword:(NSString *)password
           callback:(void (^)(BOOL))callback{
    [[PhotaServerProxy sharedInstance] registerUser:userName withPassword:password callback:^(BOOL status, id Result, NSError *error) {
        if (status) {
            NSLog(@"LoginManager user registered and logged in.");
            self.isLogin =YES;
        }else {
            NSLog(@"LoginManager fail to register user");
        }
        callback(self.isLogin);
    }];
}
 */
-(void)loginUser:(PhotaLoginModel *) loginModel{
    [[PhotaServerProxy sharedInstance] loginUser:loginModel.loginName withPassword:loginModel.password callback:^(BOOL status, id Result, NSError *error) {
        if (status) {
            NSLog(@"LoginManager user logged in:%@",Result);
            self.isLogin = YES;
        }else{
            NSLog(@"LoginManager user NOT logged in - Result:%@ Error:%@",Result,error);
        }
        loginModel.loginCallBack(self.isLogin);
    }];
}

-(void)registerUser:(PhotaLoginModel *) loginModel{
    [[PhotaServerProxy sharedInstance] registerUser:loginModel.loginName withPassword:loginModel.password callback:^(BOOL status, id Result, NSError *error) {
        if (status) {
            NSLog(@"LoginManager user registered and logged in.");
            self.isLogin =YES;
        }else {
            NSLog(@"LoginManager fail to register user");
        }
        loginModel.loginCallBack(self.isLogin);
    }];
}
-(void)loginInWithFacebook: (PhotaLoginModel *) loginModel{
    
    PhotaLoginModel * model = [[PhotaLoginModel alloc] init];
    __weak PhotaLoginManager *weakSelf = self;
    model.loginCallBack = ^(BOOL status) {
        if (status)
            weakSelf.isLogin = YES;
        loginModel.loginCallBack(status);
    };
    [[PhotaFacebookApp sharedInstance] logMeIn:model.loginCallBack];
}
-(void)logout{
    self.isLogin = NO;
    //TODO clean session and other stuff
}
+(PhotaLoginManager *)sharedInstance
{
    @synchronized(self) {
        if(sharedLoginManager == nil)
            sharedLoginManager = [[super alloc] init];
    }
    return sharedLoginManager;
}
@end
