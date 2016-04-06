//
//  SelectModelView.h
//  StudyDrive
//
//  Created by 朱元恺 on 16/4/1.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    testModel,
    lookingModel
}SelectModel;

typedef void(^SelecTouch)(SelectModel model);
@interface SelectModelView : UIView
@property(nonatomic,assign)SelectModel model;
-(SelectModelView *)initWithFrame:(CGRect)frame addTouch:(SelecTouch)touch;
@end
