//
//  SJHomeViewController.m
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/17.
//

#import "SJHomeViewController.h"

@interface SJHomeViewController ()
@property (nonatomic,strong) GPUImageView *primaryView;
@end

@implementation SJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initUI{
    self.primaryView = [[GPUImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.primaryView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.primaryView];
    
    GPUImageSketchFilter *filter = [[GPUImageSketchFilter alloc]init];
    
    GPUImageStillCamera *stillCamera = [[GPUImageStillCamera alloc]init];
    stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    [stillCamera addTarget:filter];
    [filter addTarget:self.primaryView];
}

@end
