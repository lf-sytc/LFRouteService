//
//  LFRouteManage.h
//  LFRouteService
//
//  Created by liufan on 2020/6/6.
//
//  LFRouteManage 主要负责路由绑定、路由消息的分发
//

#import <Foundation/Foundation.h>
#import "LFRouteProtocol.h"
#import <objc/objc.h>

#define LFROUTE_EXPORT_MODULE(name) \
+ (void)load { [LFRouteManage registerModule:[self class] route:name]; }

NS_ASSUME_NONNULL_BEGIN


@interface LFRouteManage : NSObject

/// 路由地址与界面、业务绑定类
/// @param moduleClass 绑定的业务
/// @param routeName 路由地址
+ (void)registerModule:(Class)moduleClass
                 route:(NSString *)routeName;




/// 是否能处理当前的路由
/// @param routeURL 路由地址
+ (BOOL)canReceiveRouteURL:(NSString *)routeURL;


/// 处理路由地址及对应业务的回调
/// @param routeURL 需要跳转的路由地址
/// @param handler 当前路由地址的回调
+ (void)receiveRouteURL:(NSString *)routeURL
             completion:(LFRouteCompletion)handler;

@end

NS_ASSUME_NONNULL_END
