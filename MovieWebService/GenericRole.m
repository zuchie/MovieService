//
//  GenericRole.m
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import "GenericRole.h"

@implementation GenericRole

- (id)initWithData:(NSDictionary *)data {
    if (self) {
        self.name = [data objectForKey:@"name"];
        self.biography = [data objectForKey:@"biography"];
        self.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"dateOfBirth"] doubleValue]];
        self.nominated = [[data objectForKey:@"nominated"] boolValue];
    }
    return self;
}

@end
