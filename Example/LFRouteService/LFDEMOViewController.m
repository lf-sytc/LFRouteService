//
//  LFDEMOViewController.m
//  LFRouteService
//
//  Created by lf_sytc@hotmail.com on 06/06/2020.
//  Copyright (c) 2020 lf_sytc@hotmail.com. All rights reserved.
//

#import "LFDEMOViewController.h"
#import <LFRouteService/LFRouteService.h>
#import "DemoModel.h"
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
    
    NSArray *titleArray = @[@"常规无参数跳转-路由绑定界面",
                            @"常规无参数跳转-路由绑定转发类"];
    NSArray *routeNameArray = @[@"route://demoOne",
                                @"route://demoTwo"];
    
    for (NSInteger i = 0; i < titleArray.count; i++) {
        DemoModel *model = [DemoModel initWithTitle:titleArray[i] routeName:routeNameArray[i]];
        [mainDataArray addObject:model];
    }
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
    DemoModel *model = mainDataArray[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}

#pragma mark - Delagete

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DemoModel *model = mainDataArray[indexPath.row];
    [LFRouteService receiveRouteURL:model.name];
}



#pragma mark - Reload View



@end
