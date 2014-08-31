//
//  ViewController.m
//  LocalNotification
//
//  Created by 金子修一郎 on 2014/09/01.
//  Copyright (c) 2014年 金子修一郎. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 通知イベントが発生するようスケジューリングします。
- (IBAction)pressSendButton
{
    //UILocalNotificationクラスのインスタンスを作成します。
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    
    //通知を受け取る時刻を指定します。
    //ここでは、現在の時間から１０秒後を指定しています。
    
    localNotif.fireDate = self.timer.date;
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    //通知メッセージの本文を指定します。
    localNotif.alertBody = [NSString stringWithFormat:@"通知を受信しました。"];
    
    //通知メッセージアラートのボタンに表示される文字を指定します。
    localNotif.alertAction = @"Open";
    
    //通知されたときの音を指定します。
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    //通知されたときのアイコンバッジの右肩に表示する数字を指定します。
    localNotif.applicationIconBadgeNumber = 1;
    
    //通知を受け取るときに送付される NSDictionary を作成します。
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"通知を受信しました。" forKey:@"EventKey"];
    localNotif.userInfo = infoDict;
    
    // 作成した通知イベント情報をアプリケーションに登録します。
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

// メイン画面にあるラベルの文字を変更する。
- (void)updateLabel: (NSString*)labelTitel
{
    _label.text = labelTitel;
}


@end
