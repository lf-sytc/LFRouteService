//
//  LFRouteTool.m
//  LFRouteService
//
//  Created by liufan on 2020/6/15.
//

#import "LFRouteTool.h"

@implementation LFRouteTool

+ (UIViewController *)currentVC{
    
    return [self traversalViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)traversalViewController:(UIViewController *)vc{
    
    if (vc && [vc isKindOfClass:[UIViewController class]]) {
        //适配RN
        if (vc.presentedViewController &&
            ![NSStringFromClass(vc.presentedViewController.class) isEqualToString:@"RCTModalHostViewController"]) {
            
             return [self traversalViewController:vc];
            
        }else if ([vc isKindOfClass:[UITabBarController class]]){
            
            UITabBarController *tabbarVC = (UITabBarController *)vc;
            UIViewController *tempVC = tabbarVC.selectedViewController == nil ?tabbarVC :tabbarVC.selectedViewController;
            return [self traversalViewController:tempVC];
            
        }else if ([vc isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController *navVC = (UINavigationController *)vc;
            UIViewController *tempVC = navVC.topViewController == nil ? navVC :navVC.topViewController;
            return [self traversalViewController:tempVC];
        }
        
         return vc;
    }
    return nil;
   
}

@end
