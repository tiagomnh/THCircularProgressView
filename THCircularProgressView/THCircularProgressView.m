//
//  THCircularProgressBar.m
//
//  Created by Tiago Henriques on 3/4/13.
//  Copyright (c) 2013 Tiago Henriques. All rights reserved.
//

#import "THCircularProgressView.h"

@interface THCircularProgressView ()

@property CGPoint center;
@property CGFloat radius;

@end

@implementation THCircularProgressView

- (id)initWithCenter:(CGPoint)center
              radius:(CGFloat)radius
           lineWidth:(CGFloat)lineWidth
       progressColor:(UIColor *)progressColor
            fillType:(THCircularProgressBarFillType)fillType
           fillColor:(UIColor *)fillColor
          percentage:(CGFloat)percentage
{
    CGRect rect = CGRectMake(center.x - radius, center.y - radius, 2 * radius, 2 * radius);
    
    self = [super initWithFrame:rect];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
 
        self.center = CGPointMake(radius, radius);
        self.radius = radius;
        self.lineWidth = lineWidth;
        self.progressColor = progressColor;
        self.fillType = fillType;
        self.fillColor = fillColor;
        self.percentage = percentage;
        
        self.centerLabel = [[UILabel alloc] initWithFrame:rect];
        self.centerLabel.center = CGPointMake(radius, radius);
        self.centerLabel.textAlignment = NSTextAlignmentCenter;
        self.centerLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.centerLabel];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawBackground:rect];
    
    if (self.percentage < 1.0f) {
        CGFloat radiusMinusLineWidth = self.radius - self.lineWidth / 2;
        
        CGFloat startAngle = -M_PI / 2 + self.percentage * 2 * M_PI;
        CGFloat endAngle = 1.5 * M_PI;
        
        UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:self.center
                                                                      radius:radiusMinusLineWidth
                                                                  startAngle:startAngle
                                                                    endAngle:endAngle
                                                                   clockwise:YES];
        
        [self.progressColor setStroke];
        progressCircle.lineWidth = self.lineWidth;
        [progressCircle stroke];
    }
}

- (void)drawBackground:(CGRect)rect
{
    switch (self.fillType) {
        case THCircularProgressBarFillTypeCircle: {
            CGContextRef ctx = UIGraphicsGetCurrentContext();
            CGContextAddEllipseInRect(ctx, rect);
            CGContextSetFillColor(ctx, CGColorGetComponents([self.fillColor CGColor]));
            CGContextFillPath(ctx);
            break;
        }
        case THCircularProgressBarFillTypeCircumference: {
            CGFloat radiusMinusLineWidth = self.radius - self.lineWidth / 2;
            UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:self.center
                                                                          radius:radiusMinusLineWidth
                                                                      startAngle:0
                                                                        endAngle:2 * M_PI
                                                                       clockwise:YES];
            [self.fillColor setStroke];
            progressCircle.lineWidth = self.lineWidth;
            [progressCircle stroke];
            break;
        }
        case THCircularProgressBarFillTypeNoFill:
        default:
            break;
    }
}

#pragma mark - Public

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    [self setNeedsDisplay];
}

- (void)setProgressColor:(UIColor *)progressColor
{
    _progressColor = progressColor;
    [self setNeedsDisplay];
}

- (void)setPercentage:(CGFloat)percentage
{
    _percentage = fminf(fmax(percentage, 0), 1);
    [self setNeedsDisplay];
}

@end