//
//  THCircularProgressBar.h
//
//  Created by Tiago Henriques on 3/4/13.
//  Copyright (c) 2013 Tiago Henriques. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Enums

typedef enum
{
    TMHCircularProgressBarFillTypeNoFill,
    TMHCircularProgressBarFillTypeCircle,
    TMHCircularProgressBarFillTypeCircumference
} TMHCircularProgressBarFillType;

#pragma mark - Interface

@interface THCircularProgressView : UIView

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat percentage;
@property (nonatomic, strong) UILabel *centerLabel;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, strong) UIColor *fillColor;
@property TMHCircularProgressBarFillType fillType;

- (id)initWithCenter:(CGPoint)center
              radius:(CGFloat)radius
           lineWidth:(CGFloat)lineWidth
       progressColor:(UIColor *)progressColor
            fillType:(TMHCircularProgressBarFillType)fillType
           fillColor:(UIColor *)fillColor
          percentage:(CGFloat)percentage;

@end
