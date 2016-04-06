//
//  Tools.h
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/24.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tools : NSObject
+(NSArray *)getAnswerWithString:(NSString *)str;
+(NSArray *)getYNAnswer;
+(CGSize)getSizeWithString:(NSString*)str withFont:(UIFont *)font withSize:(CGSize)size;
@end
