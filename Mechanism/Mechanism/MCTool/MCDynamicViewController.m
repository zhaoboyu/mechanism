//
//  MCDynamicViewController.m
//  Mechanism
//
//  Created by 赵博宇 on 2017/9/8.
//  Copyright © 2017年 赵博宇. All rights reserved.
//

#import "MCDynamicViewController.h"
#import "MCDynamicCell.h"
@interface MCDynamicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *Dtable;
@end

@implementation MCDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"动态管理";
    
    [self createBack];
    [self initTableView];
}
- (void)initTableView{
    
    self.Dtable = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.Dtable.delegate = self;
    self.Dtable.dataSource = self;
    [self.Dtable registerClass:[MCDynamicCell class] forCellReuseIdentifier:@"MCDynamicCell"];
    [self.view addSubview:_Dtable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MCDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MCDynamicCell"];
    //cell.xinM = [self.xincoffArray objectAtIndex:indexPath.section];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

@end
