//
//  ViewController.m
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/16.
//

#import "ViewController.h"
#import "SJHomeViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *cameraBtn;
@end

@implementation ViewController

bool gcdFlag = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initGCD1];
//    [self initGCD2];
//    [self initGCD3];
    
    [self.view addSubview:self.cameraBtn];
    
}

- (void)initGCD1{
    dispatch_queue_t queue = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t block1 = dispatch_block_create(0, ^{
        NSLog(@"block1 begin");
        [NSThread sleepForTimeInterval:3];
        NSLog(@"block1 end");
    });
    
    dispatch_block_t block2 = dispatch_block_create(0, ^{
        NSLog(@"block2");
    });
    
    dispatch_async(queue, block1);
    dispatch_async(queue, block2);
    //取消执行block2
    dispatch_block_cancel(block2);

}

- (void)initGCD2{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i=0; i<1000; i++) {
            NSLog(@"i:%d",i);
            sleep(1);
            if (gcdFlag == YES) {
                NSLog(@"收到GCD停止信号");
                return;
            }
        }
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"发出停止GCD信号！");
        gcdFlag = YES;
    });
}

- (void)initGCD3{
    //发现没起作用
    dispatch_queue_t queue = dispatch_queue_create("queue3", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t block1 = dispatch_block_create(0, ^{
        NSLog(@"block begin");
        [NSThread sleepForTimeInterval:3];
        NSLog(@"block end");
    });
    
    dispatch_block_t block2 = dispatch_block_create(0, ^{
        NSLog(@"block2");
    });
    
    dispatch_async(queue, block1);
    dispatch_async(queue, block2);
    //取消执行block2
    dispatch_block_testcancel(block1);
}

#pragma mark - Event
- (void)cameraBtnClick{
    SJHomeViewController *homeVC = [[SJHomeViewController alloc]init];
    [self presentViewController:homeVC animated:YES completion:nil];
}

#pragma mark - getter
- (UIButton *)cameraBtn{
    if (!_cameraBtn) {
        UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cameraBtn.frame = CGRectMake(20, 100, kScreenWidth-40,50);
        [cameraBtn setTitle:@"相机" forState:UIControlStateNormal];
        [cameraBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cameraBtn addTarget:self action:@selector(cameraBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _cameraBtn = cameraBtn;
    }
    return _cameraBtn;
}
@end
