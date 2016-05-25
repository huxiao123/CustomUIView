//
//  CustomView.m
//  CustomUIView
//
//  Created by apple on 16/5/25.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "CustomView.h"
/*
 CGContextBeginPath //开始画路径
 CGContextMoveToPoint //移动到某一点
 CGContexAddLineToPoint //画直线
 CGContexAddCurveToPoint //画饼图
 CGContexAddEllipseInRect //画椭圆
 CGContexAddArc //画圆
 CGContexAddRect //画方框
 CGContexClosePath //封闭当前路径
 */

@implementation CustomView
//使用Quartz2D画一个圆
- (void)drawRect:(CGRect)rect{
    //方法一
    [self CGContextRefOpretion];
    //方法2
    [self CGPathRefOpretion];
    //方法3
    [self BezierPahtOpretion];
    
}

//使用CGContextRef
- (void)CGContextRefOpretion{
    //1 获取上下文
    CGContextRef contextRef  = UIGraphicsGetCurrentContext();
    //2 绘制路径  圆形(中心坐标200、200、半径100、起点弧度0、终点弧度2PI、画的方向0逆1正)
    CGContextAddArc(contextRef, 200, 200, 100, 0, M_PI*2, 1);
    //修改轨迹颜色  当然也有填充修改方法
    CGContextSetRGBStrokeColor(contextRef, 0.5, 0.5, 0.9, 1.0);//笔颜色
    //设置线条宽度
    CGContextSetLineWidth(contextRef, 5);
    //渲染上下文
    CGContextStrokePath(contextRef);
}

- (void)CGPathRefOpretion{
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //创建可变路径
    CGMutablePathRef path = CGPathCreateMutable();
    //添加圆形到路径中(所在路径、不进行变换操作、中心坐标200、200、起点弧度0、终点弧度2PI、画的方向0逆1正)
    CGPathAddArc(path, NULL, 200, 400, 100, 0, M_PI * 2, 1);
    //将路径添加到上下文
    CGContextAddPath(ctx, path);
    //修改图形状态参数
    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1.0);//笔颜色
    CGContextSetLineWidth(ctx, 10);//线条宽度
    //渲染上下文
    CGContextStrokePath(ctx);
}

- (void)BezierPahtOpretion{
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200, 50, 100, 100)];
    CGPoint point = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.width/2);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:[UIScreen mainScreen].bounds.size.width/2-10/2 startAngle:0 endAngle:M_PI*2*self.progress clockwise:YES];
    [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0] setStroke];
    [path setLineWidth:5];
    [path stroke];
}
@end
