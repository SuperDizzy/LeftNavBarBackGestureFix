//
//  JEESecondViewController.m
//  LeftNavBarBackGestureFix
//
//  Created by ZhangJunjee on 14-6-17.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import "JEESecondViewController.h"
#import "JEEThirdViewController.h"

@interface JEESecondViewController ()

///设置导航栏
- (void)setNav;
///由于手动开启了自带滑动返回手势，进行此设置防止滑动返回时界面卡死（如果一个navigationController手动开启了滑动返回所有通过该navigationController push进来的视图控制器都需要在push之前调用此方法，不然有可能出现界面假死）
- (void)preSetNavForSlide;
- (void)pushNext;
- (void)back;

@end

@implementation JEESecondViewController

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
    [self setNav];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UILabel *lab_two = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [lab_two setText:@"2"];
    [lab_two setFont:[UIFont boldSystemFontOfSize:78]];
    [self.view addSubview:lab_two];
    [lab_two setCenter:self.view.center];
    // Do any additional setup after loading the view.
}

- (void)setNav
{
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleDone target:self action:@selector(pushNext)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backArrow"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    [self.navigationItem setLeftBarButtonItem:leftBarButtonItem];
    [self.navigationItem setTitle:@"SecondViewController"];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)preSetNavForSlide
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)pushNext
{
    JEEThirdViewController *thirdViewController = [[JEEThirdViewController alloc] init];
    [self preSetNavForSlide];
    [self.navigationController pushViewController:thirdViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
