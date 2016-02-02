//
//  LINKHero.h
//  01-LOL
//
//  Created by 郑博辰 on 16/2/2.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LINKHero : NSObject

/** 名称*/
@property (nonatomic, strong) NSString *name;

/** 图片*/
@property (nonatomic, strong) NSString *icon;

/** 简介*/
@property (nonatomic, strong) NSString *intro;

+ (instancetype)heroWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
