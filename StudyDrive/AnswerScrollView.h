//
//  AnswerScrollView.h
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/23.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView : UIView
{
    @public
    UIScrollView * _scrollView;
}
-(void)createView;
-(void)reloadData;
-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array;

@property(nonatomic,assign,readonly)int currentPage;
@property(nonatomic,strong)NSMutableArray *hadAnswerArray;
@property(nonatomic,strong)NSArray * dataArray;
@end
