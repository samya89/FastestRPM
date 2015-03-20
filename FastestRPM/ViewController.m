//
//  ViewController.m
//  FastestRPM
//
//  Created by Samia Al Rahmani on 3/19/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) CGFloat needleStart;
@property (nonatomic, assign) CGFloat velocityFloat;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.needleStart = 135;
    self.needle.transform = CGAffineTransformMakeRotation(self.needleStart * M_PI/180);
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    [self.view addGestureRecognizer:panGesture];
}

- (void)didPan:(id)sender
{
    UIPanGestureRecognizer *panRecog = (UIPanGestureRecognizer *)sender;
    CGPoint vel = [panRecog velocityInView:self.view];
    self.velocityFloat = sqrt(pow(vel.x, 2) + pow(vel.y, 2));
    self.needleStart = 135;
    if (panRecog.state == UIGestureRecognizerStateBegan || panRecog.state == UIGestureRecognizerStateChanged)
    {
        [self moveNeedleWithVelocity:self.velocityFloat];
        
    } else if (panRecog.state == UIGestureRecognizerStateEnded) {
        [self moveNeedleWithVelocity:self.needleStart];
    }
    
        NSLog(@"vel: %f", self.velocityFloat);
}

- (void)moveNeedleWithVelocity:(CGFloat)vel
{
    if (vel>4000.f) vel = 4000.f;
    [self moveNeedleWithPercentage:vel/4000.f];
}

-(void)moveNeedleWithPercentage:(CGFloat)perc
{
    self.needle.transform = CGAffineTransformMakeRotation((135+270.f*perc) * M_PI/180);
}


//
//- (void)moveNeedle:(CGFloat)velocity
//{
//    
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
