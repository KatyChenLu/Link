//
//  ViewController.m
//  YLink
//
//  Created by baixue on 16/4/6.
//  Copyright © 2016年 Begin. All rights reserved.
//

#import "ViewController.h"

#define VIEW_WIDTH self.view.frame.size.width
#define VIEW_HEIGHT self.view.frame.size.height


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *leftTableView;
@property (nonatomic,strong) UITableView *rightTableView;

@property (nonatomic,strong) NSMutableArray *leftDataArray;
@property (nonatomic, strong) NSMutableArray *rightDataArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    

    _leftDataArray = [[NSMutableArray alloc] initWithObjects:@"食品",@"饮料",@"粮食",@"生鲜",@"清洁",@"美妆",@"居家日用",@"母婴用品", nil];
    _rightDataArray = [[NSMutableArray alloc] init];
    [self createTableViews];
    
    
    
}


- (void)createTableViews{
    if (_leftTableView == nil) {
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH/4, VIEW_HEIGHT) style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;// 取消tableView自带的分割线
        _leftTableView.separatorColor = [UIColor greenColor];
        _leftTableView.alpha = 0.5;
    }
    if (_rightTableView == nil) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(VIEW_WIDTH/4, 64, VIEW_WIDTH*3/4, VIEW_HEIGHT-64) style:UITableViewStylePlain];
        
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.showsVerticalScrollIndicator = NO;
        _rightTableView.separatorColor = [UIColor greenColor];
        _rightTableView.backgroundColor = [UIColor clearColor];
        
        
    }
    
    
    [self.view addSubview:_leftTableView];
    [self.view addSubview:_rightTableView];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _leftTableView) {
        return 48;
    }
    else{
        return 60;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (tableView == _rightTableView) {
        return _leftDataArray.count;
    }
       return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTableView) {
        return _leftDataArray.count;
    }
    else{
        return 18;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableView == _leftTableView) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier1"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier1"];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        NSLog(@"%@",_leftDataArray[indexPath.row]);
        cell.textLabel.text = _leftDataArray[indexPath.row];
        
        return cell;
    }
    else if (tableView == _rightTableView)
    {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier2"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier2"];
        }
       // cell.backgroundColor = [UIColor clearColor];
        //cell.textLabel.text = _rightDataArray[indexPath.section][indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"商品%ld",indexPath.row];
        
        return cell;
        
        
        
    }
    return nil;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (tableView == _rightTableView) {
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 70, 200, 20);
        label.backgroundColor = [UIColor colorWithRed:224/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        label.text = _leftDataArray[section];
        label.textColor = [UIColor grayColor];
        return label;
    }
    return nil;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        [_rightTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
}


- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    
    if (tableView == _rightTableView) {
        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
