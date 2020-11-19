//
//  SJHomeViewController.m
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/17.
//

#import "SJHomeViewController.h"

@interface SJHomeViewController ()
@property (nonatomic,strong) UIButton *backBtn;

@end

@implementation SJHomeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 打开相机
        [self.stillCamera startCameraCapture];
    });
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initUI{
    [self func1];
    [self.view addSubview:self.backBtn];
   
}

- (void)func1{
    // 方法一：
    NSString *sessionPreset = AVCaptureSessionPreset1920x1080;
    self.stillCamera = [[SJStillCamera  alloc]initWithSessionPreset:sessionPreset cameraPosition:AVCaptureDevicePositionBack];
    self.stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    self.fliter = [[GPUImageSepiaFilter alloc]init];
    self.primaryView = [[GPUImageView alloc]initWithFrame:self.view.frame];
    self.view = self.primaryView;

    [self.stillCamera addTarget:self.fliter];
    [self.fliter addTarget:self.primaryView];
    
    self.smartCamera = [[SJSmartCamera alloc]init];
    self.stillCamera.delegate = self.smartCamera;

}

- (void)func2{
    // 方法二：
    NSString *sessionPreset = AVCaptureSessionPreset640x480;
    self.videoCamera = [[GPUImageVideoCamera alloc]initWithSessionPreset:sessionPreset cameraPosition:AVCaptureDevicePositionBack];
    self.videoCamera.outputImageOrientation = [UIApplication sharedApplication].statusBarOrientation;

    self.fliter = [[GPUImageSepiaFilter alloc]init];
    self.primaryView = [[GPUImageView alloc]initWithFrame:self.view.frame];
    self.view = self.primaryView;

    [self.videoCamera addTarget:self.fliter];
    [self.fliter addTarget:self.primaryView];
}

#pragma mark - Event
- (void)backBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getter
- (UIButton *)backBtn{
    if (!_backBtn) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(20, 20, 40,40);
        [backBtn setTitle:@"🔙" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _backBtn = backBtn;
    }
    return _backBtn;
}
@end
