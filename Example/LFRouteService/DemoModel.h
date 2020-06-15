//
//  DemoModel.h
//  LFRouteService_Example
//
//  Created by liufan on 2020/6/7.
//  Copyright © 2020 lf_sytc@hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *name;

+ (instancetype)initWithTitle:(NSString *)title routeName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
