//
//  LFDEMOViewController.m
//  LFRouteService
//
//  Created by lf_sytc@hotmail.com on 06/06/2020.
//  Copyright (c) 2020 lf_sytc@hotmail.com. All rights reserved.
//

#import "LFDEMOViewController.h"
#import <LFRouteService/LFRouteService.h>
@interface LFDEMOViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *mainTableView;
    NSMutableArray *mainDataArray;
}
@end

@implementation LFDEMOViewController

#pragma mark - System （SDK方法）
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}

#pragma mark - Init Data

- (void)initData{
    mainDataArray = [[NSMutableArray alloc] init];
}


#pragma mark - Init UI

- (void)initUI {
    mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    [self.view addSubview:mainTableView];
}

#pragma mark - Event

#pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mainDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    cell.textLabel.text = mainDataArray[indexPath.row];
    return cell;
}

#pragma mark - Delagete

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *route = mainDataArray[indexPath.row];
    [LFRouteService receiveRouteURL:route];
}



#pragma mark - Reload View



@end
