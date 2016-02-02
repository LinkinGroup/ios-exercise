//
//  LINKHeroViewController.m
//  ios-exercise
//
//  Created by 郑博辰 on 16/2/2.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKHeroViewController.h"
#import "LINKHero.h"

@interface LINKHeroViewController ()

/** Model Group*/
@property (nonatomic, strong) NSArray *heros;


@end

@implementation LINKHeroViewController

- (NSArray *)heros
{
    if (_heros == nil)
    {
        NSString *file = [[NSBundle mainBundle]pathForResource:@"heroes.plist"ofType:nil] ;
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:file];
        
        NSMutableArray *heros = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in dictArray) {
            LINKHero *hero =[LINKHero heroWithDict:dict];
            [heros addObject:hero];
        }
        _heros = heros;
    }
    return _heros;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 45;

    }




#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.重用标识
    // 被static修饰的局部变量：只会初始化一次，在整个程序运行过程中，只有一份内存
    
    static NSString *ID = @"hero";
    
    // 2.先根据cell的标识去缓存池中查找可循环利用的cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果cell为nil（缓存池找不到对应的cell）
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
    //    //原始代码
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    LINKHero *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    cell.detailTextLabel.text = hero.intro;
    
    
    // 3.覆盖数据
    //    cell.textLabel.text = [NSString stringWithFormat:@"testdata - %zd", indexPath.row];
    NSLog(@"testData ---- %zd",indexPath.row);
    
    
    return cell;
}




@end
