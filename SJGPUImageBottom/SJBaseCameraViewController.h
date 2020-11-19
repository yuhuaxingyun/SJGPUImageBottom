//
//  SJBaseCameraViewController.h
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/17.
//

#import <UIKit/UIKit.h>
#import "SJStillCamera.h"
#import "SJSmartCamera.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJBaseCameraViewController : UIViewController
/** 原始数据 **/
@property (nonatomic, strong) SJSmartCamera *smartCamera;
/** 相机 **/
@property (nonatomic, strong) SJStillCamera *stillCamera;
/** 相机展示的View **/
@property (nonatomic, strong) GPUImageView *primaryView;

@property (nonatomic, strong) GPUImageVideoCamera *videoCamera;

@property (nonatomic, strong) GPUImageSepiaFilter *fliter;

@end

NS_ASSUME_NONNULL_END
