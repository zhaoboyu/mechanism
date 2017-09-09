//
//  DynamicModel.h
//  Mechanism
//
//  Created by 赵博宇 on 2017/9/9.
//  Copyright © 2017年 赵博宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicModel : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)BOOL picOrMov;
@property(nonatomic,assign)NSInteger dyId;

@end
