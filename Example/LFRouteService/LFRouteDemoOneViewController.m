//
//  LFRouteDemoOneViewController.m
//  LFRouteService_Example
//
//  Created by liufan on 2020/6/6.
//  Copyright © 2020 lf_sytc@hotmail.com. All rights reserved.
//

#import "LFRouteDemoOneViewController.h"
#import <LFRouteService/LFRoute.h>


@interface LFRouteDemoOneViewController()<LFRouteProtocol>

@end

@implementation LFRouteDemoOneViewController

LFROUTE_EXPORT_MODULE(@"route://demoOne");
+ (void)LFRouteData:(NSDictionary *)data
                url:(NSURL *)url
         completion:(LFRouteCompletion)handler{
    
    LFRouteDemoOneViewController *demoOne = [[LFRouteDemoOneViewController alloc] init];
    [[LFRouteTool currentVC].navigationController pushViewController:demoOne animated:YES];
}


- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"demo one";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
