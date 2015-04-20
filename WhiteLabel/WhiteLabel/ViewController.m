//
//  ViewController.m
//  WhiteLabel
//
//  Created by Kristin Tomasik on 2/12/15.
//  Copyright (c) 2015 LaunchKey. All rights reserved.
//

#import "ViewController.h"
#import <LaunchKeyWhiteLabel/LaunchKeySDKManager.h>
#import "MBProgressHUD.h"


@interface ViewController () {
    MBProgressHUD *_hud;
    UIColor *_defaultColor, *_activeColor;
}

@end

@implementation ViewController

-(id)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(launchRequestReceived) name:@"LaunchRequestReceived" object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(![self.navigationController.navigationBar respondsToSelector:@selector(barTintColor)]) {
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:193.0/255.0 green:40.0/255.0 blue:46.0/255.0 alpha:1.0];
    }
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"navLogo"]];
    self.navigationItem.titleView = imgView;
    
    _defaultColor = [UIColor colorWithRed:(193.0/255.0) green:(40.0/255.0) blue:(46.0/255.0) alpha:1.0];
    _activeColor = [UIColor colorWithRed:(237.0/255.0) green:(48.0/255.0) blue:(46.0/255.0) alpha:1.0];
    
    _pairButton.inactiveBackground = _defaultColor;
    _pairButton.activeBackground = _activeColor;
    
    _settingsButton.inactiveBackground = _defaultColor;
    _settingsButton.activeBackground = _activeColor;
    
    _authenticateButton.inactiveBackground = _defaultColor;
    _authenticateButton.activeBackground = _activeColor;
}

-(void)launchRequestReceived {
    [[LaunchKeySDKManager sharedClient] showPendingAuthentication:self withSuccess:^{
        
    } withFailure:^(NSString *errorMessage, NSString *errorCode) {
        
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self refreshView];
}

-(void)refreshView {
    if([[LaunchKeySDKManager sharedClient] isAccountActive]) {
        _pairButton.hidden = YES;
        _authenticateButton.hidden = NO;
        _settingsButton.hidden = NO;
    } else {
        _pairButton.hidden = NO;
        _authenticateButton.hidden = YES;
        _settingsButton.hidden = YES;
    }
}

- (IBAction)pairButtonTouched:(id)sender {
    _pairButton.backgroundColor = _defaultColor;
    
    [[LaunchKeySDKManager sharedClient] showLaunchKeyPairView:self withPaired:^{
        [self refreshView];
    } withFailure:^(NSString *errorMessage, NSString *errorCode) {
        
    }];
}

- (IBAction)authenticateButtonTouched:(id)sender {
     _authenticateButton.backgroundColor = _defaultColor;
    [[LaunchKeySDKManager sharedClient] showPendingAuthentication:self withSuccess:^{
        
    } withFailure:^(NSString *errorMessage, NSString *errorCode) {
        _hud = [MBProgressHUD showHUDAddedTo:self.view  animated:YES];
        _hud.mode = MBProgressHUDModeText;
        _hud.detailsLabelText = @"You do not have any pending auth requests at this time.";
        _hud.margin = 10.f;
        _hud.removeFromSuperViewOnHide = YES;
        [_hud hide:YES afterDelay:2];
    }];
}

- (IBAction)settingsButtonTouched:(id)sender {
    _settingsButton.backgroundColor = _defaultColor;
    
    [[LaunchKeySDKManager sharedClient] showLaunchKeySettingsView:self withUnPaired:^{
        [self refreshView];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
