//
//  LaunchKeySDKManager.h
//  iOS_SDK_Test_App
//
//  Created by Kristin Tomasik on 7/3/14.
//  Copyright (c) 2014 LaunchKey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^registerSuccessBlock)();
typedef void (^successBlock)();
typedef void (^pairedBlock)();
typedef void (^unairedBlock)();
typedef void (^failureBlock)(NSString *errorMessage, NSString *errorCode);

@interface LaunchKeySDKManager : NSObject

@property (nonatomic, copy) registerSuccessBlock thisRegisterSuccess;
@property (nonatomic, copy) successBlock thisSuccess;
@property (nonatomic, copy) pairedBlock thisPaired;
@property (nonatomic, copy) unairedBlock thisUnPaired;
@property (nonatomic, copy) failureBlock thisFailure;

+(LaunchKeySDKManager*)sharedClient;

-(void)init:(NSString*)sdkKey;

-(void)setNotificationToken:(NSData *)deviceToken;
- (void)registerUser:(NSString*)qrCode
         withSuccess:(registerSuccessBlock)success
         withFailure:(failureBlock)failure;

-(BOOL)isAccountActive;

-(void)showPendingAuthentication:(UIViewController*)parentViewController withSuccess:(successBlock)success withFailure:(failureBlock)failure;
-(void)showLaunchKeySettingsView:(UIViewController*)parentViewControllerparentViewController withUnPaired:(unairedBlock)unpaired;
-(void)showLaunchKeyPairView:(UIViewController*)parentViewController withPaired:(pairedBlock)paired withFailure:(failureBlock)failure;

-(void)unpairDevice:(successBlock)success withFailure:(failureBlock)failure;
-(void)logOut:(successBlock)success withFailure:(failureBlock)failure;

@end
