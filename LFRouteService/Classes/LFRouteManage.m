//
//  LFRouteManage.m
//  LFRouteService
//
//  Created by liufan on 2020/6/6.
//

#import "LFRouteManage.h"


@interface LFRouteManage()
@property (nonatomic,strong) NSMutableDictionary *modules;
@end

@implementation LFRouteManage

+ (instancetype)sharedInstance {
    
    static LFRouteManage *lfRouteManage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lfRouteManage = [[LFRouteManage alloc] init];
    });
    return lfRouteManage;
}

- (instancetype)init{
    self = [super init];
    if (self) {
       _modules = [[NSMutableDictionary alloc] init];
    }
    return self;
}



#pragma mark - 注册路由地址

+ (void)registerModule:(Class)moduleClass
                 route:(NSString *)routeName;{
    
    if (routeName.length > 0 &&
        [moduleClass conformsToProtocol:@protocol(LFRouteProtocol) ]) {        [LFRouteManage sharedInstance].modules[routeName] = moduleClass;
    }
}


+ (BOOL)canReceiveRouteURL:(NSString *)routeURL{

    if (routeURL.length > 0) {
        return [LFRouteManage sharedInstance].modules[routeURL] != nil;
    }
    return NO;
}
#pragma mark - 分发路由消息

+ (void)receiveRouteURL:(NSString *)routeURL
             completion:(LFRouteCompletion)handler;{
    
    NSArray *temArray = [routeURL componentsSeparatedByString:@"?"];
    NSString *routeName = [temArray firstObject];
    NSString *routeData = [temArray lastObject];
    Class ocClass = [LFRouteManage sharedInstance].modules[routeName];
    if (ocClass &&
        [ocClass respondsToSelector:@selector(LFRouteData:url:completion:)]){
        NSDictionary *dic = [LFRouteManage queryDicWithStr:routeData];
        [[ocClass class] LFRouteData:dic url:routeData completion:handler];
    }
}

#pragma mark - 工具方法 处理QueryString
+ (NSDictionary *)queryDicWithStr:(NSString *)queryStr{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    NSArray *paramArray = [queryStr componentsSeparatedByString:@"&"];
    for (NSString *param in paramArray) {
        if (param && param.length) {
            NSRange range = [param rangeOfString:@"="];
            if (range.location != NSNotFound) {
                NSString *keyStr = [param substringToIndex:range.location];
                NSString *valueStr = [param substringFromIndex:range.location+range.length];
                dict[keyStr] = valueStr;
            }else{
                dict[param] = param;
            }
        }
    }
    return dict;
}

@end
