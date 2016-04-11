//
//  Tools.m
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/24.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import "Tools.h"
#import "MyDataManager.h"
@implementation Tools
+(NSArray *)getAnswerWithString:(NSString *)str
{
    NSMutableArray * array = [[NSMutableArray alloc]init];
    NSArray *arr = [str componentsSeparatedByString:@"<BR>"];
    [array addObject:arr[0]];
    for (int i = 0; i < 4; i++) {
        [array addObject:[arr[i+1] substringFromIndex:2]];
    }
    return array;
    
}



+(CGSize)getSizeWithString:(NSString *)str withFont:(UIFont *)font withSize:(CGSize)size
{
    CGSize newSize = [str sizeWithFont:font constrainedToSize:size];
    return newSize;
}


@end
