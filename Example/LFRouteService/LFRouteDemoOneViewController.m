//
//  LFRouteDemoOneViewController.m
//  LFRouteService_Example
//
//  Created by liufan on 2020/6/6.
//  Copyright © 2020 lf_sytc@hotmail.com. All rights reserved.
//

#import "LFRouteDemoOneViewController.h"
#import <LFRouteService/LFRouteManage.h>


@implementation LFRouteDemoOneViewController

LFROUTE_EXPORT_MODULE(@"LFRoute://demoOne");
+ (void)LFRouteData:(NSDictionary *)data
                url:(NSURL *)url
         completion:(LFRouteCompletion)handler{
    
}

@end
