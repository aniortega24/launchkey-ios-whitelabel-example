//
//  HighlightButton.m
//  Square Bank
//
//  Created by Kristin Tomasik on 4/17/15.
//  Copyright (c) 2015 LaunchKey. All rights reserved.
//

#import "HighlightButton.h"

@implementation HighlightButton

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
         [self initCallbacks];
    }
    return self;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        [self initCallbacks];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initCallbacks];
    }
    return self;
}

-(void)initCallbacks {
    [self addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUp) forControlEvents:UIControlEventTouchUpOutside];
}

-(void)setInactiveBackground:(UIColor*)inactiveBackground {
    _inactiveBackground = inactiveBackground;
    self.backgroundColor = inactiveBackground;
}

-(void)setActiveBackground:(UIColor*)activeBackground {
    _activeBackground = activeBackground;
}

- (void)touchDown {
    self.backgroundColor = _activeBackground;
}

- (void)touchUp {
    self.backgroundColor = _inactiveBackground;
}

- (void)touchUpInside {
    self.backgroundColor = _inactiveBackground;
}


@end
