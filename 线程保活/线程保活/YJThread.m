//
//   YJThread.m
//   线程保活
//
//   Created  by 朱允见 on 2020/6/20
//   Modified by 朱允见
//   Copyright © 2020 cn.jy. All rights reserved.
//
       

#import "YJThread.h"


@interface SubThread : NSThread
@end
@implementation SubThread
- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end


@interface YJThread ()

@property(nonatomic,strong)SubThread *mythread;
@property(nonatomic,assign)BOOL isStop;
@property(nonatomic,copy)YJThreadBlock task;

@end

@implementation YJThread

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak typeof(self)weakSelf = self;
        
        self.mythread = [[SubThread alloc]initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init]  forMode:NSDefaultRunLoopMode];

             NSLog(@"00");
            while (weakSelf&&!weakSelf.isStop) {
                //获取线程
                NSLog(@"11");
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
                NSLog(@"22");

            }
            
        }];
        [self.mythread start];
    }
    return self;
}


-(void)dotask:(YJThreadBlock)block {
    self.task = block;
    if(_isStop||block==nil)return;
    
    [self performSelector:@selector(doit) onThread:self.mythread withObject:nil waitUntilDone:YES];
}
- (void)stop {
    if(!self.mythread)return;
    
    //注意 waitUntilDone:YES  等待线程执行完任务
    [self performSelector:@selector(doStop) onThread:self.mythread withObject:nil waitUntilDone:YES];

}


-(void)doit{
    if(self.task){
        self.task();
    }
}
-(void)doStop{
    self.isStop = true;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.mythread = nil;
}



-(void)dealloc {
    [self stop];
    NSLog(@"%s 挂了",__func__);
}


@end
