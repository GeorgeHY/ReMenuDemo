//
//  ViewController.m
//  ReMenuDemo
//
//  Created by iwind on 15/5/7.
//  Copyright (c) 2015年 HanYang. All rights reserved.
//

#import "ViewController.h"
#import "REMenu.h"


@interface ViewController () <REMenuDelegate>
@property (nonatomic,strong) REMenu * menu;
@property (nonatomic,strong) UIView * view4;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger statusHeight = [[UIApplication sharedApplication]statusBarFrame].size.height;
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationBar * naviBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, statusHeight, 320, 64)];
    [naviBar setBarTintColor:[UIColor blueColor]];
    [self.view addSubview:naviBar];
    
    //barBtn
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 0, 100, 40)];
    [btn setTitle:@"收支明细" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor yellowColor];
    [naviBar addSubview:btn];
    
    //remenu
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    UILabel * label1 = [[UILabel alloc]initWithFrame:view1.bounds];
    label1.text = @"全部";
    [view1 addSubview:label1];
    view1.backgroundColor = [UIColor redColor];
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    UILabel * label2 = [[UILabel alloc]initWithFrame:view2.bounds];
    label2.text = @"收入";
    [view2 addSubview:label2];
    view2.backgroundColor = [UIColor redColor];
    UIView * view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    UILabel * label3 = [[UILabel alloc]initWithFrame:view3.bounds];
    label3.text = @"支出";
    [view3 addSubview:label3];
    view3.backgroundColor = [UIColor redColor];
    REMenuItem * allItem = [[REMenuItem alloc]initWithCustomView:view1 action:^(REMenuItem *item) {
        NSLog(@"全部");
    }];
    REMenuItem * inItem = [[REMenuItem alloc]initWithCustomView:view2 action:^(REMenuItem *item) {
        NSLog(@"收入");
    }];
    REMenuItem * outItem = [[REMenuItem alloc]initWithCustomView:view3 action:^(REMenuItem *item) {
        NSLog(@"支出");
    }]
                            ;
    self.menu = [[REMenu alloc]initWithItems:@[allItem,inItem,outItem]];
    self.view4 = [[UIView alloc]initWithFrame:CGRectMake(0, 84, 320, 568-64)];
    [self.view addSubview:self.view4];
    [self.menu close];
    [self.menu showInView:self.view4];
    
}

-(void)btnAction
{
    if (self.menu.isOpen)
        return [self.menu close];
    
    [self.menu showInView:self.view4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
