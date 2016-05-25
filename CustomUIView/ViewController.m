//
//  ViewController.m
//  CustomUIView
//
//  Created by apple on 16/5/25.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
@interface ViewController ()
@property (nonatomic,strong)CustomView *custView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomView *view = [[CustomView alloc]initWithFrame:self.view.bounds];
    view.progress = 0.2;
    [self.view addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    self.custView = view;
    
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 400, 275, 10)];
    [slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    slider.maximumValue = 1.0;
    slider.minimumValue = 0.f;
    slider.value = self.custView.progress;
    [self.view addSubview:slider];
}

- (void)changeProgress:(UISlider *)slider {
    self.custView.progress = slider.value;
    [self.custView setNeedsDisplay];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.custView.progress = 0.5;
//    [self.custView setNeedsDisplay];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
