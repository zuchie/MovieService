//
//  AppDelegate.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Film.h"

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (weak, nonatomic) IBOutlet UIWindow *window;
@property (weak, nonatomic) IBOutlet UINavigationController *navigationController;

@property (strong, nonatomic) Film *film;

@end
