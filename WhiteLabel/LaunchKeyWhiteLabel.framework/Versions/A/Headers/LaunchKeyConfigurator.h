//
//  LaunchKeyConfigurator.h
//  LaunchKeyWhiteLabel
//
//  Created by Kristin Tomasik on 3/16/15.
//  Copyright (c) 2015 LaunchKey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaunchKeyConfigurator : NSObject

+(LaunchKeyConfigurator*)sharedConfig;

-(void)setModalTextColor:(UIColor*)primaryTextColor;
-(void)setModalBackgroundColor:(UIColor*)modalBackgroundColor;
-(void)setLauncherImage:(NSString*)launcherImage;
-(void)setDarkTheme;
-(void)setLightTheme;
-(void)setSecondaryColor:(UIColor*)secondaryColor;
-(void)setSecondaryTextColor:(UIColor*)secondaryTextColor;

-(UIColor*)getModalTextColor;
-(UIColor*)getModalBackgroundColor;
-(UIColor*)getSecondaryBackgroundColor;
-(UIColor*)getSecondaryBackgroundColorWithAlpha:(float)userAlpha;
-(UIColor*)getSecondaryTextColor;
-(NSString*)getLauncherImage;
-(NSString*)getTheme;

-(void)turnOnSSLPinning;
-(void)turnOffSSLPinning;
-(BOOL)shouldEnforcePinning;

-(void)setModalAlpha:(float)alpha;
-(float)getModalAlpha;

-(BOOL)isLightTheme;
-(BOOL)isDarkTheme;

@end
