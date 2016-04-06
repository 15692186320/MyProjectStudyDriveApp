//
//  FirstViewController.m
//  StudyDrive
//
//  Created by 朱元恺 on 16/3/18.
//  Copyright © 2016年 朱元恺. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "TestSelectViewController.h"
#import "MyDataManager.h"
#import "AnswerViewController.h"
@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    NSArray * _dataArray;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;//UI的布局坐标（0,0）不计算入导航栏高度
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"科目一:理论考试";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    [self createTableView];
        [self createView];
    _dataArray = @[@"章节练习",@"顺序练习",@"随机练习",@"专项练习",@"仿真模拟考试"];
}

-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    

}


-(void)createView{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height-64-140, 300, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"•••••••••••我的考试分析•••••••••••";
    label.textColor = [UIColor grayColor];
    
    [self.view addSubview:label];
    NSArray * arr = @[@"我的错题",@"我的收藏",@"我的成绩",@"练习统计"];
    for (int i = 0; i < 4; i++) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(self.view.frame.size.width/4*i+self.view.frame.size.width/4/2-30, self.view.frame.size.height-64-100, 60, 60);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",12+i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:btn];
        UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4*i+self.view.frame.size.width/4/2-28, self.view.frame.size.height-64-35, 60, 20)];
        lab.text = arr[i];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont boldSystemFontOfSize:13];
        [self.view addSubview:lab];
        
    }
}

-(void)btnClick:(UIButton *)btn
{
    
}


#pragma mark -tableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellID = @"FirstTableViewCell";
    FirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell ==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:CellID owner:self options:nil]lastObject];
    }
    cell.myImageVIew.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row+7]];
    cell.myLabel.text = _dataArray[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0://章节练习
        {
            TestSelectViewController * con = [[TestSelectViewController alloc]init];
            con.dataArray = [MyDataManager getData:chapter];
            con.myTitle = @"章节练习";
            con.subtype = 1;
            UIBarButtonItem * item = [[UIBarButtonItem alloc]init];
            item.title = @"";
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:con animated:YES];
        }
            break;
        case 1://顺序练习
        {
            AnswerViewController * answer = [[AnswerViewController alloc]init];
            answer.answertype = 2;
            [self.navigationController pushViewController:answer animated:YES];
            
            
        }
            break;
        case 2://顺序练习
        {
            AnswerViewController * answer = [[AnswerViewController alloc]init];
            answer.answertype = 3;
            [self.navigationController pushViewController:answer animated:YES];
            
            
        }
            break;
        case 3://专项练习
        {
            TestSelectViewController * con = [[TestSelectViewController alloc]init];
            con.dataArray = [MyDataManager getData:subChapter];
            con.myTitle = @"专项练习";
            UIBarButtonItem * item = [[UIBarButtonItem alloc]init];
            item.title = @"";
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:con animated:YES];
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
