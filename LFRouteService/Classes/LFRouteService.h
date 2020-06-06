//
//  LFRouteService.h
//  LFRouteService
//
//  Created by liufan on 2020/6/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFRouteService : NSObject

+ (BOOL)canReceiveRouteURL:(NSString *)routeUrl;

+ (void)receiveRouteURL:(NSString *)routeUrl;

@end

NS_ASSUME_NONNULL_END
