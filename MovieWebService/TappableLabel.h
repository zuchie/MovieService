//
//  TappableLabel.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 20/8/15.
//  Copyright (c) 2015 Tan, Michael (Agoda). All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TappableLabelDelegate;

@interface TappableLabel : UILabel

@property (nonatomic, strong) id<TappableLabelDelegate> delegate;

@end

@protocol TappableLabelDelegate <NSObject>

@optional

- (void)didReceiveTouch;

@end