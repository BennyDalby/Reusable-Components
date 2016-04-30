//
//  ReusableViewController.m
//  Component1
//
//  Created by CLPricingTeam on 12/29/14.
//  Copyright (c) 2014 Philips. All rights reserved.
//

#import "ReusableViewController.h"
#import "ReusableComponent.h"

@interface ReusableViewController ()

@end

@implementation ReusableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.reuseView shareInstance:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
