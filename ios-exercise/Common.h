//
//  Common.h
//  ios-exercise
//
//  Created by 郑博辰 on 16/1/23.
//  Copyright © 2016年 com.link. All rights reserved.
//

#define HEXCOLORA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:a]
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]
#define RGBCOLORA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGBCOLOR(r,g,b) RGBCOLORA(r,g,b,(1.0))

#define REQ_PAGE_SIZE 20
#define SCREEN_W [[UIScreen mainScreen] bounds].size.width
#define SCREEN_H [[UIScreen mainScreen] bounds].size.height
#define NAV_H 64
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]