//
//  NSObject+XQTimer.m
//  Appollo4
//
//  Created by WXQ on 2018/8/27.
//  Copyright © 2018年 SyKing. All rights reserved.
//

#import "NSObject+XQTimer.h"
#import <XQProjectTool/NSObject+XQExchangeIMP.h>

@implementation NSObject (XQTimer)

- (void)xq_createTimerWithTime:(CGFloat)time walltime:(CGFloat)walltime {
    if (self.xq_ocTimer || time <= 0) {
        return;
    }
        //DISPATCH_TIME_NOW
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        //dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, time * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, walltime * NSEC_PER_SEC), time * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        [self operationTimer];
    });
    dispatch_resume(timer);
    self.xq_ocTimer = timer;
}

- (void)xq_cancelTimer {
    if (!self.xq_ocTimer) {
        return;
    }
    
    dispatch_source_cancel(self.xq_ocTimer);
    self.xq_ocTimer = nil;
}

- (void)setXq_ocTimer:(dispatch_source_t)xq_ocTimer {
    [NSObject xq_setAssociatedObject:self key:@"NSObject+XQTimer" value:xq_ocTimer policy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
}

- (dispatch_source_t)xq_ocTimer {
    return [NSObject xq_getAssociatedObject:self key:@"NSObject+XQTimer"];
}

@end































