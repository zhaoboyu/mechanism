//
//  MCDynamicViewController.m
//  Mechanism
//
//  Created by 赵博宇 on 2017/9/8.
//  Copyright © 2017年 赵博宇. All rights reserved.
//

#import "MCDynamicViewController.h"
#import "MCDynamicCell.h"
#import "DynamicModel.h"
#import "MCDySecViewController.h"
@interface MCDynamicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *Dtable;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation MCDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"动态管理";
    
    self.dataArr = [NSMutableArray array];
    [self createBack];
    [self initTableView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self startRequest];
}
- (void)startRequest{
    DynamicModel *model = [[DynamicModel alloc]init];
    model.name = @"啊哈";
    model.content =@"剧透好的骄傲还健康";
    model.picOrMov = YES;
    model.time = @"2017-5-10";
    model.dyId = 001;
    for (int i= 0; i< 5; i ++) {
        [self.dataArr addObject:model];
    }
    [self.Dtable reloadData];
    [DataAfn POST:@"service/getOrgActivityList3" params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}
- (void)initTableView{
    
    self.Dtable = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.Dtable.delegate = self;
    self.Dtable.dataSource = self;
    self.Dtable.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
       self.Dtable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.Dtable registerClass:[MCDynamicCell class] forCellReuseIdentifier:@"MCDynamicCell"];
    [self.view addSubview:_Dtable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MCDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MCDynamicCell"];
     cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [cell selectDynamic:self.dataArr[indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MCDySecViewController *dySec = [[MCDySecViewController alloc]init];
    [self.navigationController pushViewController:dySec animated:YES];
}

@end
