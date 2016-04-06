//
//  MyDataManager.m
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/21.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import "MyDataManager.h"
#import "FMDatabase.h"
#import "TestSelectModel.h"
#import "AnswerModel.h"
#import "SubTestSaleModel.h"
@implementation MyDataManager
+(NSArray *)getData:(DataType)type{
    static FMDatabase * dataBase;
    NSMutableArray * array = [[NSMutableArray alloc]init];
    if (dataBase == nil) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];
        dataBase = [[FMDatabase alloc]initWithPath:path];
    }
    if ([dataBase open]) {
        NSLog(@"open success");
    }else{
        return array;
    }
    switch (type) {
        case chapter:
        {
            NSString * sql = @"select pid,pname,pcount FROM firstlevel";
            FMResultSet * rs = [dataBase executeQuery:sql];
            while ([rs next]) {
                TestSelectModel * model = [[TestSelectModel alloc]init];
                model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname = [rs stringForColumn:@"pname"];
                model.pcount = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pcount"]];
                [array addObject:model];
                
            }
        }
            break;
        case answer:{
    NSString *sql = @"select mquestion,mdesc,mid,manswer,mimage,pid,pname,sid,sname,mtype FROM leaflevel";
            FMResultSet * rs = [dataBase executeQuery:sql];
            while ([rs next]) {
                AnswerModel * model = [[AnswerModel alloc]init];
                model.mquestion = [rs stringForColumn:@"mquestion"];
                model.mdesc = [rs stringForColumn:@"mdesc"];
                model.mid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"mid"]];
                model.manswer = [rs stringForColumn:@"manswer"];
                model.mimage = [rs stringForColumn:@"mimage"];
                model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname = [rs stringForColumn:@"pname"];
                model.sid = [NSString stringWithFormat:@"%.2f",[rs doubleForColumn:@"sid"]];
                model.sname = [rs stringForColumn:@"sname"];
                model.mtype = [rs stringForColumn:@"mtype"];
                
                [array addObject:model];
                
            }
        }
            break;
        case subChapter:{
            NSString * sql = @"select sid,sname,pid,scount,rcount,serial FROM secondlevel";
            FMResultSet * rs = [dataBase executeQuery:sql];
            while ([rs next]) {
                SubTestSaleModel * sb = [[SubTestSaleModel alloc]init];
                sb.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                sb.scount = [NSString stringWithFormat:@"%d",[rs intForColumn:@"scount"]];
                sb.sid = [NSString stringWithFormat:@"%.2f",[rs doubleForColumn:@"sid"]];
                sb.sname = [rs stringForColumn:@"sname"];
                sb.serial = [NSString stringWithFormat:@"%d",[rs intForColumn:@"serial"]];
                
                [array addObject:sb];
            }
        }
            break;
        default:
            break;
    }
    
    
    return array;
}
@end
