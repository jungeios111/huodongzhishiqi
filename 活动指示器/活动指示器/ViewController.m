//
//  ViewController.m
//  活动指示器
//
//  Created by ZKJ on 16/9/18.
//  Copyright © 2016年 ZKJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *lightView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAReplicatorLayer *repl = [CAReplicatorLayer layer];
    repl.frame = _lightView.bounds;
    [_lightView.layer addSublayer:repl];
    
    CALayer *layer = [CALayer layer];
    layer.transform = CATransform3DMakeTranslation(0, 0, 0);
    layer.position = CGPointMake(_lightView.bounds.size.width / 2, 20);
    layer.bounds = CGRectMake(0, 0, 10, 10);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    [repl addSublayer:layer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.fromValue = @1;
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    CGFloat duration = 1;
    anim.duration = duration;
    [layer addAnimation:anim forKey:nil];
    
    int count = 20;
    CGFloat angle = M_PI * 2 / count;
    repl.instanceCount = count;
    repl.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    repl.instanceDelay = duration / count;
    
}

@end
