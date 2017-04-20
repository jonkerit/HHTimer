//
//  ViewController.m
//  HHTimer
//
//  Created by jonker on 17/4/20.
//  Copyright © 2017年 haihuilai. All rights reserved.
//

#import "ViewController.h"
#import "HHTimer.h"
@interface ViewController ()
@property (nonatomic, strong) HHTimer *timer;
@property (nonatomic, assign) NSInteger times;
@end

@implementation ViewController
- (IBAction)start:(id)sender {
    if (self.timer) {
        return;
    }
    self.times = 0;
    self.suspend.userInteractionEnabled = YES;
    self.continues.userInteractionEnabled = NO;
    self.cancel.userInteractionEnabled = YES;
    self.timer = [HHTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(actuonTime:) userInfo:@{@"key":self.biaoqian.text} repeats:YES];
}
- (void)actuonTime:(id)info
{
    NSLog(@"come on baby--%ld!",self.times);
    [self.biaoqian setText:[NSString stringWithFormat:@"%ld",++self.times]];
}

- (IBAction)continues:(id)sender {
    [self.timer reStart];
    self.suspend.userInteractionEnabled = YES;
    self.continues.userInteractionEnabled = NO;
    self.cancel.userInteractionEnabled = YES;
}

- (IBAction)cancel:(id)sender {
    [self.biaoqian setText:[NSString stringWithFormat:@"定时器被销毁"]];
    [self.timer invalidate];
    self.suspend.userInteractionEnabled = NO;
    self.continues.userInteractionEnabled = NO;
    self.cancel.userInteractionEnabled = NO;
    self.timer = nil;

}
- (IBAction)suspend:(id)sender {
    [self.timer stop];
    self.suspend.userInteractionEnabled = YES;
    self.continues.userInteractionEnabled = YES;
    self.cancel.userInteractionEnabled = YES;
}
@end
