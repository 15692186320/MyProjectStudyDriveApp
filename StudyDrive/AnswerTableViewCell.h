//
//  AnswerTableViewCell.h
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/23.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *numberImage;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end
