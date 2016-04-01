//
//  LoadingCircleView.m
//  LoadingNavigationBar
//
//  Created by 朱何进 on 16/3/4.
//  Copyright © 2016年 hejin. All rights reserved.
//

#import "HCLoadingCircleView.h"

@interface HCLoadingCircleView()

@property (nonatomic,strong) CAShapeLayer *circleLayer;

@property (nonatomic,assign) CGPoint circleCenter;

@end

@implementation HCLoadingCircleView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addCustomCircleLayer];
    }
    return self;
}

//添加进度条
- (void)addCustomCircleLayer {
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.fillColor = nil;
    self.circleLayer.strokeColor = [UIColor orangeColor].CGColor;
    self.circleLayer.lineWidth = 1.0f;
    self.circleLayer.frame = CGRectMake(0, 0, 30, 30);
    self.circleLayer.lineCap = kCALineCapRound;
    
    self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:self.center radius:10 startAngle:-M_PI/2 endAngle:M_PI + M_PI/2 clockwise:YES].CGPath;
    
    self.circleLayer.strokeStart = 0.0;
    self.circleLayer.strokeEnd = 0.9;
    [self.layer addSublayer:self.circleLayer];
}


- (void)startAnimation {

    if (self.isAnimating) {
        [self stopAnimation];
        [self.layer removeAllAnimations];
    }
    _isAnimating = YES;
    
    [self startRotateAnimation];
}

- (void)stopAnimation
{
    _isAnimating = NO;
    
    [self stopRotateAnimation];
}


- (void)startRotateAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(2*M_PI);
    animation.duration = 1.f;
    animation.repeatCount = INT_MAX;
    
    [self.circleLayer addAnimation:animation forKey:@"keyFrameAnimation"];
}

- (void)stopRotateAnimation
{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self.layer removeAllAnimations];
        self.alpha = 1;
    }];
}


@end
