//
//  LINKHerosStore.m
//  ios-exercise
//
//  Created by Kai.Li on 2/3/16.
//  Copyright © 2016 com.link. All rights reserved.
//

#import "LINKHerosStore.h"
#import "LINKHero.h"

@interface LINKHerosStore ()

@end

@implementation LINKHerosStore

+ (instancetype) sharedInstance
{
    static LINKHerosStore *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //此处命名规范 file 修改为 path
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heroes.plist" ofType:nil] ;
        NSArray *herosArr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *heros = [[NSMutableArray alloc] init];
        for (NSDictionary *item in herosArr) {
            LINKHero *hero =[LINKHero heroWithDict:item];
            [heros addObject:hero];
        }
        _heros = heros;
    }
    return self;
}

- (NSArray *) fetchPage:(NSInteger)page size:(NSInteger)size
{
    NSInteger count = _heros.count - size * page;
    if (count < REQ_PAGE_SIZE) {
        return @[];
    }else {
        return [_heros subarrayWithRange:NSMakeRange(size * page, REQ_PAGE_SIZE)];
    }
}

@end
