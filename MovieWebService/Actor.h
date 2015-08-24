//
//  Actor.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericRole.h"

@interface Actor : GenericRole

@property (nonatomic, strong) NSString *screenName;

- (id)initWithData:(NSDictionary *)data;

@end
