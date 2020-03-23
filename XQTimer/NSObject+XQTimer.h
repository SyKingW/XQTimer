//
//  NSObject+XQTimer.h
//  Appollo4
//
//  Created by WXQ on 2018/8/27.
//  Copyright © 2018年 SyKing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol XQTimerDelegate <NSObject>

@property (nonatomic, strong) dispatch_source_t xq_ocTimer;

/**
 计时器调用
 */
- (void)operationTimer;

@end

@interface NSObject (XQTimer) <XQTimerDelegate>


/**
 创建计时器
 
 @param time 不能为0, 为0, 则不创建
 @param walltime 第一次启动等待时间
 */
- (void)xq_createTimerWithTime:(CGFloat)time walltime:(CGFloat)walltime;

/**
 取消计时器
 */
- (void)xq_cancelTimer;



@end
