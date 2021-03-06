//
//  AnswerViewController.m
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/23.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import "AnswerViewController.h"
#import "AnswerScrollView.h"
#import "MyDataManager.h"
#import "AnswerModel.h"
#import "SelectModelView.h"
#import "SheetView.h"
#import "SubTestSaleModel.h"
#import "TestSelectViewController.h"
@interface AnswerViewController ()<SheetViewDelegate>
{
    AnswerScrollView  * sview;
    SelectModelView * ModelView;
    SheetView * _sheetView;
 
    
}

@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
        [self createData];
    [self createModelView];
    [self.view addSubview:sview];
 
    [self createToolBar];

   
   [self createSheetView];
    
}

-(void)createData{
    if (_answertype == 1) {
        NSMutableArray * arr = [[NSMutableArray alloc]init];
        NSArray * array = [MyDataManager getData:answer];
        NSLog(@"ciao%d",(int)array.count);
        
        for (int i = 0; i < array.count-1 ; i++) {
            AnswerModel * model = array[i];
                
           
            if ([model.pid intValue] == _number + 1) {
                [arr addObject:model];
            }
                
        }
        sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:arr];
              }else if (_answertype == 2)
              {
        sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:[MyDataManager getData:answer]];
              }
    else if (_answertype == 3){
        NSMutableArray * temArr = [[NSMutableArray alloc]init];
        NSArray * array = [MyDataManager getData:answer];
        NSMutableArray * dataArray = [[NSMutableArray alloc]init];
        [temArr addObjectsFromArray:array];
        
        int t = (int)temArr.count;
        for (int i = 0; i < t; i++) {
            int index = arc4random()%(temArr.count);
            [dataArray addObject:temArr[index]];
            [temArr removeObjectAtIndex:index];
        }
        sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:dataArray];
    } else if (_answertype == 4) {
        NSMutableArray * arr = [[NSMutableArray alloc]init];
        NSArray * array = [MyDataManager getData:answer];
        NSMutableArray * err = [[NSMutableArray alloc]init];//选择题数组
        NSMutableArray * frr = [[NSMutableArray alloc]init];//判断题数组
        for (AnswerModel * ans in array) {
            if ([ans.mtype intValue] == 1) {
                [err addObject:ans];
            }else{
                [frr addObject:ans];
            }
        }
        
        NSLog(@"((((((((((%d))))))))))",_ccelltype);
        
//        NSMutableArray * temparr = [[NSMutableArray alloc]init];
//                NSMutableArray * ttemparr = [[NSMutableArray alloc]init];
        NSLog(@"ciao%d",(int)array.count);

//        for (int i = 0; i < array.count-1 ; i++) {
//            AnswerModel * model = array[i];
        
        switch (_ccelltype) {
            case 0:
                for (AnswerModel * model in array) {
                    if ([model.sid isEqualToString:_subStrNumber]&&[model.mtype intValue] == 1) {
                      //  NSLog(@"1caocaocoacoaocaocaocaocaocao");
                        [arr addObject:model];
                        sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:arr];
                        
                    }
                }
                break;
                
                case 1:
                for (AnswerModel * model in array) {
                    
               
    if ([model.sid isEqualToString:_subStrNumber]&&[model.mtype intValue ] == 2){
                            
    NSLog(@"caocaocoacoaocaocaocaocaocao");
    [arr addObject:model];
sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:arr];
                            
                        }
                    }
                break;
            default:
                break;
        }
        
        
        
//if (test.celltype == 0) {
//for (AnswerModel * model in err) {
//if ((test.celltype ==1)&&[model.sid isEqualToString:_subStrNumber]&&[model.mtype intValue] == 1) {
//                    NSLog(@"1caocaocoacoaocaocaocaocaocao");
//                    [temparr addObject:model];
//sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:temparr];
//
//        }
//        }
//}else if (test.celltype == 1){
//    for (AnswerModel * model in frr) {
//    if ([model.sid isEqualToString:_subStrNumber]&&[model.mtype intValue ] == 2){
//        
//    NSLog(@"caocaocoacoaocaocaocaocaocao");
//                        [ttemparr addObject:model];
//                        sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:ttemparr];
//        
//                    }
//                }
//
//    
//}

    
        
        
        
        
        
//        for (AnswerModel * model in err) {
//            
//        if ((test.celltype ==1)&&[model.sid isEqualToString:_subStrNumber]&&[model.mtype intValue] == 1) {
//               NSLog(@"1caocaocoacoaocaocaocaocaocao");
//                [temparr addObject:model];
//                sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:temparr];
//            }else if ((test.celltype == 1 )&&[model.sid isEqualToString:_subStrNumber]&&[model.mtype intValue ] == 2){
//            for (AnswerModel * model in frr) {
//
//            NSLog(@"caocaocoacoaocaocaocaocaocao");
//                [ttemparr addObject:model];
//                sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:ttemparr];
//
//            }
//        }
//    

    }else if (_answertype == 5){
        NSMutableArray * temArr = [[NSMutableArray alloc]init];
        NSArray * array = [MyDataManager getData:answer];
        NSMutableArray * dataArray = [[NSMutableArray alloc]init];
        [temArr addObjectsFromArray:array];
        
 //       int t = (int)temArr.count;
        for (int i = 0; i < 100; i++) {
            int index = arc4random()%(temArr.count);
            [dataArray addObject:temArr[index]];
            [temArr removeObjectAtIndex:index];
        }
        sview = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60) withDataArray:dataArray];
        [self createNavBtn];
        
    }

}

-(void)createNavBtn{
    UIBarButtonItem * itemLeft = [[UIBarButtonItem alloc]init];
    itemLeft.title = @"返回";
    [itemLeft setTarget:self];
    [itemLeft setAction:@selector(clickNavBtnReturn)];
    self.navigationItem.leftBarButtonItem = itemLeft;
    
    
}

-(void)clickNavBtnReturn{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"1" message:@"2" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * oneaction = [UIAlertAction actionWithTitle:@"3" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction * otheraction = [UIAlertAction actionWithTitle:@"4" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:oneaction];
    [alert addAction:otheraction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)createSheetView{
    _sheetView = [[SheetView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - 80) withSuperView:self.view andQuesCount:(int)sview.dataArray.count];
    [self.view addSubview:_sheetView];
        _sheetView.delegate = self;
    
}



#pragma mark SheetView Delegate
-(void)SheetViewClick:(int)index{
    UIScrollView * scroll = sview -> _scrollView;
    if (index == 1) {
        scroll.contentOffset = CGPointMake((index-1)*scroll.frame.size.width, 0);
        [sview createView];

    }else{
        scroll.contentOffset = CGPointMake((index-1)*scroll.frame.size.width, 0);

    }
    NSLog(@"＊＊＊＊%f",scroll.contentOffset.x);
    [scroll.delegate scrollViewDidEndDecelerating:scroll];
    
}

-(void)createModelView{
    ModelView = [[SelectModelView alloc]initWithFrame:self.view.frame addTouch:^(SelectModel model) {
        NSLog(@"当前模式%d",model);
    }];
    [self.view addSubview:ModelView];
    ModelView.alpha = 0;
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"答题模式" style:UIBarButtonItemStylePlain target:self action:@selector(modelChange:)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)modelChange:(UIBarButtonItem *)item{
    [UIView animateWithDuration:0.3 animations:^{
        ModelView.alpha = 1;
    }];
    
}

-(void)createToolBar{
    UIView * barView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-64 - 60, self.view.frame.size.width, 60)];
    barView.backgroundColor = [UIColor whiteColor];
    barView.opaque = NO;
    NSArray * arr = @[[NSString stringWithFormat:@"%d",(int)sview.dataArray.count],@"查看答案",@"收藏本题"];
    for (int i = 0; i < 3; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                          
    btn.frame = CGRectMake(self.view.frame.size.width/3*i+self.view.frame.size.width/3/2 - 22, 0, 36, 36);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",16+i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-2.png",16+i]] forState:UIControlStateHighlighted];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(btn.center.x - 30, 40, 60, 18)];
        btn.tag = 301+i;
        [btn addTarget:self action:@selector(ToolbarClick:) forControlEvents:UIControlEventTouchUpInside];
        
        label.textAlignment = NSTextAlignmentCenter;
        label.text = arr[i];
        label.font = [UIFont systemFontOfSize:14];
        [barView addSubview:btn];
        [barView addSubview:label];
        
    }
    NSLog(@"123456");
    [self.view addSubview:barView];
}


-(void)ToolbarClick:(UIButton *)btn{
    switch (btn.tag) {
            case 301:
        {
            [UIView animateWithDuration:0.3 animations:^{
                _sheetView.frame = CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80);
                _sheetView -> _backView.alpha = 0.8;
            }];
        }
            break;
        case 302://查看答案
        {
            if ([sview.hadAnswerArray[sview.currentPage] intValue] !=0) {
                return;
            }else{
                AnswerModel * model = [sview.dataArray objectAtIndex:sview.currentPage];
                NSString * answer = model.manswer;
                char an = [answer characterAtIndex:0];
                [sview.hadAnswerArray replaceObjectAtIndex:sview.currentPage withObject:[NSString stringWithFormat:@"%d",an-'A'+1]];
                [sview reloadData];
            }
        }
            break;
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
