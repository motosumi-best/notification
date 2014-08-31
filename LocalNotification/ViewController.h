//
//  ViewController.h
//  LocalNotification
//
//  Created by 金子修一郎 on 2014/09/01.
//  Copyright (c) 2014年 金子修一郎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIDatePicker *timer;
@property (nonatomic, retain) IBOutlet UILabel *label;

- (void)updateLabel: (NSString*)labelTitel;

@end
