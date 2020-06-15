//
//  DemoModel.m
//  LFRouteService_Example
//
//  Created by liufan on 2020/6/7.
//  Copyright © 2020 lf_sytc@hotmail.com. All rights reserved.
//

#import "DemoModel.h"

@implementation DemoModel

+ (instancetype)initWithTitle:(NSString *)title
                    routeName:(NSString *)name {
    
    DemoModel *model = [[DemoModel alloc] init];
    model.title = title;
    model.name =  name;
    return model;
}

@end
