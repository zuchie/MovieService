//
//  GenericRole.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;

@interface GenericRole : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *biography;
@property (nonatomic, strong) NSDate *dateOfBirth;
@property (nonatomic) BOOL nominated;

@property (atomic, strong) Film *film;

- (id)initWithData:(NSDictionary *)data;

@end
