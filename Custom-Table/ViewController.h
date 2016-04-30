//
//  ViewController.h
//  CustomTable
//
//  Created by b.dalby.thoomkuzhy on 9/30/13.
//  Copyright (c) 2013 b.dalby.thoomkuzhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ExpandedTable.h"

@interface ViewController : UIViewController<BOExpandableTableViewDelegate>
{

    ExpandedTable *dashboardTable;
    UILabel *label;

}


@end
