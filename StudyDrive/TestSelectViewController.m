//
//  TestSelectViewController.m
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/19.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import "TestSelectViewController.h"
#import "TestSelectTableViewCell.h"
#import "TestSelectModel.h"
#import "AnswerViewController.h"
#import "SubTestSaleModel.h"
@interface TestSelectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
}

@end

@implementation TestSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = _myTitle;
    [self createTableView];
   
}

-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return _dataArray.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"TestSelectTableViewCell";
    TestSelectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.numberLabel.layer.masksToBounds = YES;
        cell.numberLabel.layer.cornerRadius = 8;
    }
    if (_subtype == 1) {
        TestSelectModel * model = _dataArray[indexPath.row];
        cell.numberLabel.text = model.pid;
        cell.titleLabel.text = model.pname;
        

    }
    else{
        SubTestSaleModel * model = _dataArray[indexPath.row];
        cell.numberLabel.text = model.serial;
        cell.titleLabel.text = model.sname;
     
    }
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnswerViewController * avc = [[AnswerViewController alloc]init];
    if (_subtype == 1) {
        avc.answertype = 1;
        avc.number = (int)indexPath.row;

    }else{
        SubTestSaleModel * model = _dataArray[indexPath.row];
        avc.subStrNumber = model.sid;
        avc.answertype = 4;
        if (indexPath.row == 0 ) {//0 = 选择题 1 = 判断题
           _celltype = 0;
        }else if (49 >indexPath.row > 0 && indexPath.row % 2 !=0 ){
            _celltype = 1;
        }else if (49 >indexPath.row > 0 && indexPath.row % 2 == 0){
            _celltype = 0;
        }else if (indexPath.row == 49){
            _celltype = 0;
        }else if (indexPath.row > 49 && indexPath.row % 2 != 0){
            _celltype = 0;
        }else{
            _celltype = 1;
        }
        NSLog(@"%ld",(long)indexPath.row);
        NSLog(@"------%d-------",_celltype);
        
        
        
    }
     avc.ccelltype = _celltype;
    [self.navigationController pushViewController:avc animated:YES];
   
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
