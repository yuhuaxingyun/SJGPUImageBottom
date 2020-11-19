//
//  SJStillCamera.h
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/19.
//

#import <GPUImage/GPUImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJStillCamera : GPUImageStillCamera
// 获取原图
- (void)captureOriginalPhotoWithCompletion:(void(^)(UIImage *image))completion;
@end

NS_ASSUME_NONNULL_END
