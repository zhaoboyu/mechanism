//
//  MCToolViewController.m
//  Mechanism
//
//  Created by 赵博宇 on 2017/9/8.
//  Copyright © 2017年 赵博宇. All rights reserved.
//

#import "MCToolViewController.h"

@interface MCToolViewController ()

@end

@implementation MCToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = BackColor;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
   self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    [self initView];
    
}
- (void)initView{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, def_width, 350*scaleH)];
    backView.backgroundColor = BlueColor;
    [self.view addSubview:backView];
    
    UIView* (^roomView)(CGRect ,NSString *,NSString *) = ^(CGRect frame,NSString *text,NSString *imageName){
       
        UIView *roomView = [[UIView alloc]initWithFrame:frame];
        roomView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/3, frame.size.height/6, frame.size.width/3, frame.size.height/3)];
        imageV.backgroundColor = [UIColor blackColor];
        imageV.image = [UIImage imageNamed:imageName];
        [roomView addSubview:imageV];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height/3*2, frame.size.width,  frame.size.height/3)];
        label.textColor = [UIColor blackColor];
        label.text = text;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [roomView addSubview:label];
        [self.view addSubview:roomView];
        return roomView;
        
    };
    
    for (int i=0; i < 9; i ++) {
        if (i==8) {
            UIView *roomView = [[UIView alloc]initWithFrame:CGRectMake((def_width -2)/3*2 +2, 370*scaleH+(def_width-2)/3/5*4 *2 +2, (def_width-2)/3, (def_width-2)/3/5*4)];
            roomView.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:roomView];
        }else{
           UIView *room= roomView(CGRectMake((i % 3) *(def_width -2)/3 +(i%3) , i <3?370*scaleH:i <6?370*scaleH+(def_width -2)/3/5*4 +1:370*scaleH+(def_width-2)/3/5*4 *2 +2 , (def_width-2)/3, (def_width-2)/3/5*4),@"活动",@"");
            room.tag = i+9999;
        }
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  
    
    return UIStatusBarStyleLightContent;
}


@end
