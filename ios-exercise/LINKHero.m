//
//  LINKHero.m
//  01-LOL
//
//  Created by 郑博辰 on 16/2/2.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKHero.h"

@implementation LINKHero

+ (instancetype)heroWithDict:(NSDictionary *)dict{
    LINKHero *hero = [[self alloc] init];
    [hero setValuesForKeysWithDictionary:dict];
    return hero;
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self != [super init])
    {
    self = [LINKHero heroWithDict:dict];
    }
    return self;
}

@end
