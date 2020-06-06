//
//  LFRouteProtocol.h
//  LFRouteService
//
//  Created by liufan on 2020/6/6.
//

#ifndef LFRouteProtocol_h
#define LFRouteProtocol_h

#import <Foundation/Foundation.h>

typedef void(^LFRouteCompletion)(id objc);

@protocol LFRouteProtocol <NSObject>

+ (void)LFRouteData:(NSDictionary *)data
                url:(NSString *)url
         completion:(LFRouteCompletion)handler;

@end



#endif /* LFRouteProtocol_h */
