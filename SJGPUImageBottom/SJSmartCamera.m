//
//  SJSmartCamera.m
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/19.
//

#import "SJSmartCamera.h"

@implementation SJSmartCamera

- (void)willOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer{
    NSLog(@"原始数据");
}

@end
