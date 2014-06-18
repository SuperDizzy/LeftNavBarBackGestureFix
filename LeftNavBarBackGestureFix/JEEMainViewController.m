//
//  JEEMainViewController.m
//  LeftNavBarBackGestureFix
//
//  Created by ZhangJunjee on 14-6-17.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import "JEEMainViewController.h"
#import "JEESecondViewController.h"

@interface JEEMainViewController ()

///设置导航栏
- (void)setNav;
///由于手动开启了自带滑动返回手势，进行此设置防止滑动返回时界面卡死（如果一个navigationController手动开启了滑动返回所有通过该navigationController push进来的视图控制器都需要在push之前调用此方法，不然有可能出现界面假死）
- (void)preSetNavForSlide;
- (void)pushNext;

@end

@implementation JEEMainViewController

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
    UILabel *lab_one = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [lab_one setText:@"1"];
    [lab_one setFont:[UIFont boldSystemFontOfSize:78]];
    [self.view addSubview:lab_one];
    [lab_one setCenter:self.view.center];
}

- (void)setNav
{
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.delegate = self;
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleDone target:self action:@selector(pushNext)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    [self.navigationItem setTitle:@"MainViewController"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushNext
{
    JEESecondViewController *secondViewController = [[JEESecondViewController alloc] init];
    [self preSetNavForSlide];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)preSetNavForSlide
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

#pragma mark - UIGestureRecognizerDelegate 在根视图时不响应interactivePopGestureRecognizer手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1)
        return NO;
    else
        return YES;
}

#pragma mark - navigationDelegate 实现此代理方法也是为防止滑动返回时界面卡死
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //开启滑动手势
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

@end
