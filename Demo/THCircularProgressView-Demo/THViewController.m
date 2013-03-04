//
//  THViewController.m
//  THCircularProgressView-Demo
//
//  Created by Tiago Henriques on 3/4/13.
//  Copyright (c) 2013 Tiago Henriques. All rights reserved.
//

#import "THViewController.h"

@interface THViewController ()

@end

@implementation THViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%f %f", self.view.frame.size.width, self.view.frame.size.height);
        
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat radius = width / 4 * 0.8;
    
    THCircularProgressView *example1 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .25, height * .25)
                                                                               radius:radius
                                                                            lineWidth:20.0f
                                                                        progressColor:[UIColor redColor]
                                                                             fillType:THCircularProgressBarFillTypeCircle
                                                                            fillColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f]
                                                                           percentage:0.3f];
    [self.view addSubview:example1];
    
    
    THCircularProgressView *example2 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .75, height * .25)
                                                                               radius:radius
                                                                            lineWidth:20.0f
                                                                        progressColor:[UIColor greenColor]
                                                                             fillType:THCircularProgressBarFillTypeCircumference
                                                                            fillColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f]
                                                                           percentage:0.3f];
    [self.view addSubview:example2];
    
    THCircularProgressView *example3 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .25, height * .75)
                                                                               radius:radius
                                                                            lineWidth:radius
                                                                        progressColor:[UIColor blueColor]
                                                                             fillType:THCircularProgressBarFillTypeCircle
                                                                            fillColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f]
                                                                           percentage:0.3f];
    [self.view addSubview:example3];

    THCircularProgressView *example4 = [[THCircularProgressView alloc] initWithCenter:CGPointMake(width * .75, height * .75)
                                                                               radius:radius
                                                                            lineWidth:radius
                                                                        progressColor:[UIColor purpleColor]
                                                                             fillType:THCircularProgressBarFillTypeCircle
                                                                            fillColor:[UIColor clearColor]
                                                                           percentage:0.3f];
    [self.view addSubview:example4];
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
