//
//   main.m
//   线程保活
//
//   Created  by 朱允见 on 2020/6/20
//   Modified by 朱允见
//   Copyright © 2020 cn.jy. All rights reserved.
//
       

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
