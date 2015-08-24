//
//  Actor.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import "Actor.h"

@implementation Actor

- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.screenName = [data objectForKey:@"screenName"];
    }
    return self;
}

@end
