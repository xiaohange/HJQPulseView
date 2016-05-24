//
//  ViewController.m
//  HJQPulseView
//
//  Created by HaRi on 06/21/16.
//  Copyright © 2016 HanJunqiang. All rights reserved.
//

#import "ViewController.h"
#import "HJQPulseView.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *pulseArray;

@end

@implementation ViewController
- (IBAction)voiceAction:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *pulseArray = @[].mutableCopy;
    for ( int i = 0 ; i < 1 ; ++i ){
        [pulseArray addObject:[[HJQPulseView alloc]init]];
    }
    self.pulseArray = pulseArray;
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    for ( int i = 0 ; i < 1; ++i )
    {
        for ( int j = 0 ; j < 1; ++j )
        {
            NSInteger index = i*1+j;
            HJQPulseView *pulseView = pulseArray[0];
            
            pulseView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 120,
                                         [UIScreen mainScreen].bounds.size.height - 215,
                                         240,
                                         240);
            
            [self.view addSubview:pulseView];
            
            switch (index) {
                case 0:
                {
                    pulseView.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                    pulseView.colors = @[(__bridge id)[UIColor colorWithRed:0.996 green:0.647 blue:0.008 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:1 green:0.31 blue:0.349 alpha:1].CGColor];
                    
                    CGFloat posY = (CGRectGetHeight(screenRect)-320)/2/CGRectGetHeight(screenRect);
                    pulseView.startPoint = CGPointMake(0.5, posY);
                    pulseView.endPoint = CGPointMake(0.5, 1.0f - posY);
                    
                    pulseView.minRadius = 30.6;
                    pulseView.maxRadius = 120;
                    
                    pulseView.duration = 2;
                    pulseView.count = 4;
                    pulseView.lineWidth = 2.0f;
                    
                    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                    [self.view addSubview:btn];
                    [btn setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
                    [btn setTitle:@"Tap" forState:UIControlStateNormal];
                    btn.frame = CGRectMake(0, 0, 70, 70);
                    btn.center = pulseView.center;
                    [btn addTarget:self action:@selector(actionPulse) forControlEvents:UIControlEventTouchUpInside];
                    break;
                }
                default:
                    break;
            }
        }
    }
}

- (void)actionPulse
{
    HJQPulseView *pulseView = self.pulseArray[0];
    
    pulseView.tag = 1 - pulseView.tag;
    
    (pulseView.tag>0)?[pulseView startAnimation]:[pulseView stopAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

@end
