//
//  ViewController.h
//  WhiteLabel
//
//  Created by Kristin Tomasik on 2/12/15.
//  Copyright (c) 2015 LaunchKey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HighlightButton.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet HighlightButton *pairButton;
@property (weak, nonatomic) IBOutlet HighlightButton *authenticateButton;
@property (weak, nonatomic) IBOutlet HighlightButton *settingsButton;

@end

