//
//  LINKHerosStore.h
//  ios-exercise
//
//  Created by Kai.Li on 2/3/16.
//  Copyright © 2016 com.link. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LINKHerosStore : NSObject

@property (nonatomic,strong) NSArray *heros;

+ (instancetype) sharedInstance;
- (NSArray *) fetchPage:(NSInteger) page size:(NSInteger) size;

@end
