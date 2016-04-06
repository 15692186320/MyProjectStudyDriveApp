//
//  SheetView.h
//  StudyDrive
//
//  Created by 朱元恺 on 16/4/1.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SheetViewDelegate

-(void)SheetViewClick:(int)index;

@end



@interface SheetView : UIView
{
    @public
    UIView *_backView;
}
@property(nonatomic,weak)id<SheetViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame withSuperView:(UIView *)superView andQuesCount:(int)count;


@end
