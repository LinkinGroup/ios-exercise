//
//  LINKHeroViewController.m
//  ios-exercise
//
//  Created by 郑博辰 on 16/2/2.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKHeroViewController.h"
#import "LINKHero.h"
#import "MJRefresh.h"
#import "LINKHerosStore.h"

@interface LINKHeroViewController ()

/** Model Group*/
@property (nonatomic, strong) NSMutableArray *heros;
@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation LINKHeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageIndex = 0;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 70;
    
    _heros = [NSMutableArray arrayWithArray:[[LINKHerosStore sharedInstance] fetchPage:self.pageIndex size:REQ_PAGE_SIZE]];
    
    __unsafe_unretained typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf setPageIndex:0];
            NSArray *heros = [[LINKHerosStore sharedInstance] fetchPage:weakSelf.pageIndex size:REQ_PAGE_SIZE];
            [weakSelf.heros removeAllObjects];
            [weakSelf.heros addObjectsFromArray:heros];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        });
    }];
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.pageIndex ++;
            NSArray *heros = [[LINKHerosStore sharedInstance] fetchPage:weakSelf.pageIndex size:REQ_PAGE_SIZE];
            if (heros.count > 0) {
                [weakSelf.heros addObjectsFromArray:heros];
                [weakSelf.tableView reloadData];
                if (heros.count < REQ_PAGE_SIZE) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
            }else {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        });
    }];
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
    
    
    return cell;
}




@end
