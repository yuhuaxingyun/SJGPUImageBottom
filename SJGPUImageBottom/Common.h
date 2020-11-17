//
//  Common.h
//  SJGPUImageBottom
//
//  Created by 宋江 on 2020/11/17.
//

#ifndef Common_h
#define Common_h

//页面背景颜色
#define BasebackColor [UIColor whiteColor]
//屏幕宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕宽度比例(6s为标准)
#define kScreenWidthScale(num) num * kScreenWidth / 375
//屏幕高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//屏幕高度比例(6s为标准)
#define kScreenHeightScale(num) (num * kScreenHeight / 667)

#endif /* Common_h */
