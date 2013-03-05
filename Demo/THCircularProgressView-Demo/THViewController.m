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
    CGFloat radius = width / 4 * 0.8;
    
    THCircularProgressView *example1 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .25, height * .25)
                                                                               radius:radius
                                                                            lineWidth:10.0f
                                                                        progressColor:[UIColor redColor]
                                                               progressBackgroundMode:THProgressBackgroundModeCircle
                                                              progressBackgroundColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f]
                                                                           percentage:self.percentage];
    [self.view addSubview:example1];
    [self.examples addObject:example1];
    
    
    THCircularProgressView *example2 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .75, height * .25)
                                                                               radius:radius
                                                                            lineWidth:30.0f
                                                                        progressColor:[UIColor greenColor]
                                                               progressBackgroundMode:THProgressBackgroundModeCircumference
                                                              progressBackgroundColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f]
                                                                           percentage:self.percentage];
    [self.view addSubview:example2];
    [self.examples addObject:example2];
    
    THCircularProgressView *example3 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .25, height * .75)
                                                                               radius:radius
                                                                            lineWidth:radius
                                                                        progressColor:[UIColor blueColor]
                                                               progressBackgroundMode:THProgressBackgroundModeCircle
                                                              progressBackgroundColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f]
                                                                           percentage:self.percentage];
    [self.view addSubview:example3];
    [self.examples addObject:example3];
    
    THCircularProgressView *example4 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .75, height * .75)
                                                                               radius:radius
                                                                            lineWidth:radius
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
    
    NSLog(@"%f", self.percentage);
    
    for (THCircularProgressView* progressView in self.examples) {
        progressView.percentage = self.percentage;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return false;
}

@end
