//
//  MyDataManager.h
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/21.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    chapter,
    answer,
    subChapter,
}DataType;
@interface MyDataManager : NSObject
+(NSArray *)getData:(DataType)type;
@end
