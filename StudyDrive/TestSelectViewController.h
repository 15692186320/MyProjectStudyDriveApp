//
//  TestSelectViewController.h
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/19.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestSelectViewController : UIViewController

@property(nonatomic,copy)NSString * myTitle;
@property(nonatomic,copy)NSArray * dataArray;
//type=1章节  type=2专项
@property(nonatomic,assign)int subtype;

@end
