//
//  LFRouteService.m
//  LFRouteService
//
//  Created by liufan on 2020/6/6.
//

#import "LFRouteService.h"
#import "LFRouteManage.h"
@implementation LFRouteService


+ (BOOL)receiveRouteURL:(NSString *)routeUrl
             completion:(LFRouteCompletion)handler{
    if ([LFRouteManage canReceiveRouteURL:routeUrl]) {
        [LFRouteManage receiveRouteURL:routeUrl completion:handler];
        return YES;
    }
    return NO;
}

+ (BOOL)receiveRouteURL:(NSString *)routeUrl{
    return [self receiveRouteURL:routeUrl completion:nil];
}

@end
