//
//   ThreadVC.m
//   线程保活
//
//   Created  by 朱允见 on 2020/6/20
//   Modified by 朱允见
//   Copyright © 2020 cn.jy. All rights reserved.
//
       

#import "ThreadVC.h"
#import "YJThread.h"

@interface ThreadVC ()

@property(nonatomic,strong)YJThread *yjthread;

@end

@implementation ThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.yjthread = [[YJThread alloc]init];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_yjthread dotask:^{
        NSLog(@"任务来了");
    }];
}


- (IBAction)pressStop:(id)sender {
    
    [_yjthread stop];
    
}

-(void)dealloc {
    NSLog(@"%s 挂了",__func__);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
