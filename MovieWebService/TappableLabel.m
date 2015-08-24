//
//  TappableLabel.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 20/8/15.
//  Copyright (c) 2015 Tan, Michael (Agoda). All rights reserved.
//

#import "TappableLabel.h"

@implementation TappableLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    BOOL selected = (CGRectContainsPoint(self.bounds, touchPoint));
    
    if (selected) {
        [self.delegate didReceiveTouch];
    }
}

@end
