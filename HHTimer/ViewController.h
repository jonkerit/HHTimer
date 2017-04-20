//
//  ViewController.h
//  HHTimer
//
//  Created by jonker on 17/4/20.
//  Copyright © 2017年 haihuilai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *suspend;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UIButton *continues;
@property (weak, nonatomic) IBOutlet UILabel *biaoqian;
- (IBAction)continues:(id)sender;

- (IBAction)start:(id)sender;
- (IBAction)cancel:(id)sender;

- (IBAction)suspend:(id)sender;
@end

