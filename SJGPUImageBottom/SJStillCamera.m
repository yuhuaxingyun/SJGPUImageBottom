//
//  SJStillCamera.m
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/19.
//

#import "SJStillCamera.h"

@implementation SJStillCamera
- (id)initWithSessionPreset:(NSString *)sessionPreset cameraPosition:(AVCaptureDevicePosition)cameraPosition{
    self = [super initWithSessionPreset:sessionPreset cameraPosition:cameraPosition];
    if (self) {
        AVCaptureStillImageOutput *photoOutput = [self valueForKey:@"photoOutput"];
        NSDictionary *outputSettings = @{AVVideoCodecKey : AVVideoCodecJPEG};
        [photoOutput setOutputSettings:outputSettings];
    }
    return self;
}

- (void)captureOriginalPhotoWithCompletion:(void (^)(UIImage * _Nonnull))completion{
    AVCaptureStillImageOutput *photoOutput = [self valueForKey:@"photoOutput"];
    [photoOutput captureStillImageAsynchronouslyFromConnection:[photoOutput connectionWithMediaType:AVMediaTypeVideo] completionHandler:^(CMSampleBufferRef  _Nullable imageDataSampleBuffer, NSError * _Nullable error) {
        NSData *data;
        UIImage *image;
        if (!error) {
            data = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            image = [UIImage imageWithData:data];
        }
        completion(image);
    }];
}
@end
