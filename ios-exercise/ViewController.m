//
//  ViewController.m
//  ios-exercise
//
//  Created by 郑博辰 on 16/1/21.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, 320, 180)];
    //修改代码注释
    [imgView sd_setImageWithURL:[NSURL URLWithString:@"http://ww1.sinaimg.cn/bmiddle/005vimW9gw1f05tjnz94ij30b40b4jrn.jpg"]
               placeholderImage:[UIImage imageNamed:@"fastcat"]
                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                          if (!error) {
                              NSLog(@"下载成功");
                          }else{
                              NSLog(@"%@",error.domain);
                          }
    }];
    [self.view addSubview:imgView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
