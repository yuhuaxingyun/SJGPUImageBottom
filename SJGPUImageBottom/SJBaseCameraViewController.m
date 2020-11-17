//
//  SJBaseCameraViewController.m
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/17.
//

#import "SJBaseCameraViewController.h"

@interface SJBaseCameraViewController ()

@end

@implementation SJBaseCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BasebackColor;
    
    [self initData];
    
    [self initUI];
}

- (void)initData{
    
}

- (void)initUI{
    [self initCamera];
}

- (void)initCamera{
    
}
@end
