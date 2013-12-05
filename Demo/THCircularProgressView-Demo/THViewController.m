//
//  THViewController.m
//  THCircularProgressView-Demo
//
//  Created by Tiago Henriques on 3/4/13.
//  Copyright (c) 2013 Tiago Henriques. All rights reserved.
//

#import "THViewController.h"

@interface THViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *examples;
@property (nonatomic) CGFloat percentage;

@end

@implementation THViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.examples = [[NSMutableArray alloc] init];
    
    self.percentage = 0;
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat radius = floor(width / 4 * 0.8);

    THCircularProgressView *example1 = [[THCircularProgressView alloc] initWithFrame:CGRectZero];

    example1.progressColor = [UIColor redColor];
    example1.progressBackgroundColor = [UIColor colorWithWhite:0.96f alpha:1.0f];
    example1.percentage = self.percentage;
    example1.progressBackgroundMode = THProgressBackgroundModeCircle;
    example1.progressMode = THProgressModeDeplete;
    example1.clockwise = NO;
    example1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:example1];
    [self.examples addObject:example1];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:example1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:example1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:example1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:radius*2]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:example1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:example1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    THCircularProgressView *example2 = [[THCircularProgressView alloc] initWithFrame:CGRectMake(width * .75 - radius, height * .25 - radius, radius*2, radius*2)];
    example2.lineWidth = 30.0f;
    example2.progressColor = [UIColor greenColor];
    example2.centerLabel.font = [UIFont boldSystemFontOfSize:radius];
    example2.centerLabelVisible = YES;
    [self.view addSubview:example2];
    [self.examples addObject:example2];
    
    THCircularProgressView *example3 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .25, height * .75)
                                                                               radius:radius
                                                                            lineWidth:radius
                                                                         progressMode:THProgressModeDeplete
                                                                        progressColor:[UIColor blueColor]
                                                               progressBackgroundMode:THProgressBackgroundModeCircle
                                                              progressBackgroundColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f]
                                                                           percentage:self.percentage];
    example3.clockwise = NO;
    [self.view addSubview:example3];
    [self.examples addObject:example3];
    
    THCircularProgressView *example4 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .75, height * .75)
                                                                               radius:radius
                                                                            lineWidth:radius
                                                                         progressMode:THProgressModeFill
                                                                        progressColor:[UIColor purpleColor]
                                                               progressBackgroundMode:THProgressBackgroundModeNone
                                                              progressBackgroundColor:nil
                                                                           percentage:self.percentage];
    [self.view addSubview:example4];
    [self.examples addObject:example4];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.timer invalidate];
}

- (void)timerFired:(NSTimer *)timer
{
    self.percentage += 0.005;
    if (self.percentage >= 1) {
        self.percentage = 0;
    }
    
    for (THCircularProgressView* progressView in self.examples) {
        progressView.percentage = self.percentage;
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
{
    // tap to change size
    
    static BOOL originalSize = YES;
    CGFloat multiplier = 0.5f;
    if (!originalSize) {
        multiplier = 2.0f;
    }
    originalSize = !originalSize;
    
    
    for (THCircularProgressView *view in self.examples) {
        CGRect frame = view.frame;
        frame.size.width = CGRectGetWidth(view.frame) * multiplier;
        frame.size.height = CGRectGetHeight(view.frame) * multiplier;
        view.frame = frame;
    }
}

@end
