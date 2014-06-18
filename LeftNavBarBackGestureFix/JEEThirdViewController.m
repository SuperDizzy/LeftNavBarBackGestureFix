//
//  JEEThirdViewController.m
//  LeftNavBarBackGestureFix
//
//  Created by ZhangJunjee on 14-6-17.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import "JEEThirdViewController.h"

@interface JEEThirdViewController ()

///设置导航栏
- (void)setNav;
- (void)back;

@end

@implementation JEEThirdViewController

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
    UILabel *lab_three = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [lab_three setText:@"3"];
    [lab_three setFont:[UIFont boldSystemFontOfSize:78]];
    [self.view addSubview:lab_three];
    [lab_three setCenter:self.view.center];
    // Do any additional setup after loading the view.
}

- (void)setNav
{
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backArrow"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    [self.navigationItem setLeftBarButtonItem:leftBarButtonItem];
    [self.navigationItem setTitle:@"ThirdViewController"];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
