//
//  LFRouteDemoTwo.m
//  LFRouteService_Example
//
//  Created by liufan on 2020/6/15.
//  Copyright © 2020 lf_sytc@hotmail.com. All rights reserved.
//

#import "LFRouteDemoTwo.h"
#import <LFRouteService/LFRoute.h>
#import "LFRouteDemoTwoViewController.h"

@interface LFRouteDemoTwo()<LFRouteProtocol>

@end


@implementation LFRouteDemoTwo


LFROUTE_EXPORT_MODULE(@"route://demoTwo")

+ (void)LFRouteData:(NSDictionary *)data
                url:(NSString *)url
         completion:(LFRouteCompletion)handler {
    
    
    LFRouteDemoTwoViewController *demoTwoVC = [[LFRouteDemoTwoViewController alloc] init];
    
    [[LFRouteTool currentVC].navigationController pushViewController:demoTwoVC animated:YES];

    
}

@end
