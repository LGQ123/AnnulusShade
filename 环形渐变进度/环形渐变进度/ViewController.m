//
//  ViewController.m
//  环形渐变进度
//
//  Created by ydz on 2017/6/16.
//  Copyright © 2017年 lgq. All rights reserved.
//

#import "ViewController.h"
#import "DM_CircleView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DM_CircleView *view = [[DM_CircleView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.center = self.view.center;
    [self.view addSubview:view];
    [view setPercent:60 animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
