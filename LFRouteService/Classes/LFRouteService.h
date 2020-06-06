//
//  LFRouteService.h
//  LFRouteService
//
//  Created by liufan on 2020/6/6.
//
//  对外业务层

#import <Foundation/Foundation.h>
#import "LFRouteProtocol.h"
@interface LFRouteService : NSObject

+ (BOOL)receiveRouteURL:(NSString *)routeUrl;

+ (BOOL)receiveRouteURL:(NSString *)routeUrl
             completion:(LFRouteCompletion)handler;

@end
