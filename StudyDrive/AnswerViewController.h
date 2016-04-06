//
//  AnswerViewController.h
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/23.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController
@property(nonatomic,assign) int number;
@property(nonatomic,copy)NSString * subStrNumber;
//type = 1章节 type =2 顺序 type = 3随机 type = 4专项练习
@property(nonatomic,assign) int answertype;

@end
