//
//  DM_CircleView.m
//  jianBianMe
//
//  Created by ydz on 2017/1/10.
//  Copyright © 2017年 lgq. All rights reserved.
//
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#import "DM_CircleView.h"

@interface DM_CircleView ()

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation DM_CircleView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        [self cricle];
        
    }
    
    return self;
}

- (void)cricle {
    //创建背景圆环
    CAShapeLayer *trackLayer = [CAShapeLayer layer];
    trackLayer.frame = self.bounds;
    //清空填充色
    trackLayer.fillColor = [UIColor clearColor].CGColor;
    //设置画笔颜色 即圆环背景色
    trackLayer.strokeColor =  [UIColor clearColor].CGColor;
    trackLayer.lineWidth = 40;
    //设置画笔路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:self.frame.size.width/2.0 - 20 startAngle:-M_PI_2 endAngle:-M_PI_2+M_PI*2 clockwise:YES];//逆时针 startAngle  endAngle 的值替换clockwise 设为NO
    //path 决定layer将被渲染成何种形状
    trackLayer.path = path.CGPath;
    [self.layer addSublayer:trackLayer];
    
    CALayer *gradientLayer = [CALayer layer];
    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
    gradientLayer1.frame = CGRectMake(0, 0, 200 , 200);
    [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[RGBA(254, 24, 64, 1) CGColor],(id)[RGBA(48, 130, 208, 1) CGColor], nil]];
//    [gradientLayer1 setLocations:@[@0.2,@1]];
    [gradientLayer1 setStartPoint:CGPointMake(0, 0)];
    [gradientLayer1 setEndPoint:CGPointMake(0, 1)];
    [gradientLayer addSublayer:gradientLayer1];
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor  = [[UIColor blueColor] CGColor];
//    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = 40;
    _progressLayer.path = [path CGPath];
    [gradientLayer setMask:_progressLayer];
    [self.layer addSublayer:gradientLayer];
}

-(void)setPercent:(NSInteger)percent animated:(BOOL)animated
{
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:2.0f];
    _progressLayer.strokeEnd = percent/100.0;
    [CATransaction commit];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
