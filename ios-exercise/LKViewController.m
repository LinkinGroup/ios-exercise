//
//  ViewController.m
//  ios-exercise
//
//  Created by 郑博辰 on 16/1/21.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LKViewController.h"
#import "UIImageView+WebCache.h"
#import "MDButton.h"
#import "FlatUIKit.h"

#define HEXCOLORA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:a]
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]
#define RGBCOLORA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGBCOLOR(r,g,b) RGBCOLORA(r,g,b,(1.0))

@interface LKViewController ()

@property (nonatomic,strong) UITableView *tbView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) UIButton *topBtn;

@property (weak, nonatomic) UIButton *leftBtn;

@end

@implementation LKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //Add MDaaaa
//    MDButton *button = [[MDButton alloc] initWithFrame:CGRectMake(0, 260, 180, 40) type:Flat rippleColor:HEXCOLOR(0xffffff)];
//    [button setTitle:@"Stephen" forState:UIControlStateNormal];
//    [button setBackgroundColor:HEXCOLOR(0x32B5C5)];
//    [button.layer setCornerRadius:10.0f];
//    [self.view addSubview:button];
    
    
    //添加UISrocllView
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fastcat"]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    imageView.image = [UIImage imageNamed:@"fastcat"];
    
    [self.scrollView addSubview:imageView];
    
//    self.scrollView.contentSize = imageView.image.size;
    self.scrollView.contentSize = CGSizeMake(200, 200);
    self.scrollView.contentInset = UIEdgeInsetsMake(50, 50, 50, 50);

//    //自动布局：
    UIImageView *img = [[UIImageView alloc] init];
    img.backgroundColor = [UIColor redColor];
    [self.view addSubview:img];
    
    img.translatesAutoresizingMaskIntoConstraints = NO;

    //高度约束
    NSLayoutConstraint *heightS = [NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [self.view addConstraint:heightS];
    
    
    NSLayoutConstraint *widthS = [NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:widthS];
    
    NSLayoutConstraint *leftX = [NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.view addConstraint:leftX];

    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.view addConstraint:centerY];


    //按钮TOP:
    FUIButton *topBtn = [[FUIButton alloc] initWithFrame:CGRectMake(35, 300, 100, 30)];
    topBtn.buttonColor = [UIColor purpleColor];
    topBtn.shadowColor  = [UIColor blackColor];
    topBtn.highlightedColor  = [UIColor blueColor];
    topBtn.disabledColor  = [UIColor grayColor];
    topBtn.disabledShadowColor  = [UIColor cyanColor];
    topBtn.shadowHeight = 5.0;
    topBtn.cornerRadius = 5;
    [topBtn setTitle:@"TOP" forState:UIControlStateNormal];

    [topBtn addTarget:self action:@selector(top) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:topBtn];
    
    //按钮LEFT:
    FUIButton *leftBtn = [[FUIButton alloc] initWithFrame:CGRectMake(155, 300, 100, 30)];
    leftBtn.buttonColor = [UIColor purpleColor];
    leftBtn.shadowColor  = [UIColor blackColor];
    leftBtn.highlightedColor  = [UIColor blueColor];
    leftBtn.disabledColor  = [UIColor grayColor];
    leftBtn.disabledShadowColor  = [UIColor cyanColor];
    leftBtn.shadowHeight = 5.0;
    leftBtn.cornerRadius = 5;
    [leftBtn setTitle:@"LEFT" forState:UIControlStateNormal];
    
    [leftBtn addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
     //按钮BOTTON:
    [self addButtonWithCGRectMake:CGRectMake(275, 300, 100, 30) ButtonColor:[UIColor purpleColor] shadowColor:[UIColor blackColor] highlightColor:[UIColor blueColor] disabledColor:[UIColor grayColor] disabledShadowColor:[UIColor cyanColor] title:@"BOTTON"action:@selector(botton)];
    
}
    //创建按钮方法：
- (UIButton *)addButtonWithCGRectMake:(CGRect)btnRect ButtonColor:(UIColor *)bColor shadowColor:(UIColor *)sColor highlightColor: (UIColor *)hColor disabledColor: (UIColor *)dColor disabledShadowColor:(UIColor *)dSColor title:(NSString *)btnTitle action:(SEL)action //shadowHeight:(CGFloat)sHeight cornerRadius: (int)cRadius
{
    FUIButton *btn = [[FUIButton alloc] initWithFrame:btnRect];
    btn.buttonColor = bColor;
    btn.shadowColor  = sColor;
    btn.highlightedColor  = hColor;
    btn.disabledColor  = dColor;
    btn.disabledShadowColor  = dSColor;
    btn.shadowHeight = 5.0;
    btn.cornerRadius = 5;
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    return btn;
}

- (void)top
{
    self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x,0);

}
    
- (void)left
{
    self.scrollView.contentOffset = CGPointMake(0,self.scrollView.contentOffset.y);
    
}

- (void)botton
{
//    CGFloat totalH = self.scrollView.contentSize.height - self.scrollView.frame.size.height + self.scrollView.contentInset.bottom + self.scrollView.contentInset.bottom;
//    self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, totalH);
    CGFloat totalH = self.scrollView.contentSize.height - self.scrollView.frame.size.height ;
    self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, totalH);
    
}
    
    
//    //修改代码注释
//    [imgView  sd_setImageWithURL:[NSURL URLWithString:@"http://ww1.sinaimg.cn/bmiddle/005vimW9gw1f05tjnz94ij30b40b4jrn.jpg"]
//               placeholderImage:[UIImage imageNamed:@"fastcat"]
//                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                          if (!error) {
//                              NSLog(@"下载成功");
//                          }else{
//                              NSLog(@"%@",error.domain);
//                          }
//    }];
//
//    [self.view addSubview:imgView];
//    // Do any additional setup after loading the view, typically from a nib.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
