//
//  HHTimer.h
//  haihuilai
//
//  Created by jonker on 17/4/19.
//  Copyright © 2017年 SunPengcheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHTimer : NSObject

+ (nullable HHTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)time target:(nullable id)aTarget selector:(nullable SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
- (void)reStart;
- (void)stop;
- (void)invalidate;
@end
