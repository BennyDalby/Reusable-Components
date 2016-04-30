//
//  ReusableComponent.h
//  Component1
//
//  Created by CLPricingTeam on 12/29/14.
//  Copyright (c) 2014 Philips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReusableViewController.h"

@interface ReusableComponent : UIView
{
    CAShapeLayer *borderCircle ;
     UIBezierPath *path ;
    BOOL collinatorTouched ;
    CGFloat a,b,c,d,e,f,g,h ;
    BOOL squarePressed,circlePressed ;
}

@property (nonatomic, weak) CAShapeLayer *maskLayer;
@property(nonatomic) IBOutlet UIView *subview ;
@property (nonatomic, weak) CAShapeLayer *circleLayer;
@property (nonatomic) CGFloat circleRadius;
@property (nonatomic) CGPoint circleCenter;
@property(nonatomic)   UIImageView *collinator ;

-(void)shareInstance:(ReusableViewController*)mainController;
@end
