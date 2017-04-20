//
//  HHTimer.m
//  haihuilai
//
//  Created by jonker on 17/4/19.
//  Copyright © 2017年 SunPengcheng. All rights reserved.
//

#import "HHTimer.h"
@interface HHTimer ()
@property (nonatomic, strong) id timer_source;
@end

@implementation HHTimer

+ (nullable HHTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval target:(nullable id)aTarget selector:(nullable SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)isRepeats{
    HHTimer *timers = [[HHTimer alloc] init];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    timers.timer_source = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, timeInterval*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [aTarget performSelectorOnMainThread:aSelector withObject:userInfo waitUntilDone:NO];
                if (!isRepeats) {
                    dispatch_source_cancel(timer);
                }
            });
    });
    dispatch_resume(timer);
    return timers;
}

- (void)reStart
{
    //    只有存在timer_source，（timer_source没有被释放）
    if (self.timer_source && dispatch_source_testcancel(self.timer_source) == 0) {
        dispatch_resume(self.timer_source);
    }
}
- (void)stop
{
    if (self.timer_source && dispatch_source_testcancel(self.timer_source) == 0) {
        dispatch_suspend(self.timer_source);
    }
   
}
- (void)invalidate
{
    do {
        dispatch_source_cancel(self.timer_source);
    } while (dispatch_source_testcancel(self.timer_source) == 0);
}
@end
