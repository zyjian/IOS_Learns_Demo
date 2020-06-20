//
//   YJThread.h
//   线程保活
//
//   Created  by 朱允见 on 2020/6/20
//   Modified by 朱允见
//   Copyright © 2020 cn.jy. All rights reserved.
//
       

#import <Foundation/Foundation.h>


typedef void(^YJThreadBlock)(void);

@interface YJThread : NSObject

-(void)dotask:(YJThreadBlock) block ;

-(void)stop;

@end


