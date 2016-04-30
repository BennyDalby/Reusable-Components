//
//  ViewController.m
//  CustomTable
//
//  Created by b.dalby.thoomkuzhy on 9/30/13.
//  Copyright (c) 2013 b.dalby.thoomkuzhy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dashboardTable = [[ExpandedTable alloc]initWithFrame:CGRectMake(20, 110, 280, 300) style:UITableViewStylePlain];
    dashboardTable.dataSource = dashboardTable;
    dashboardTable.delegate = dashboardTable;
    dashboardTable.exDelegate = self;
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(50, 50, 200, 40)];
    
    dashboardTable.scrollEnabled = YES;
    dashboardTable.opaque = NO;
    dashboardTable.backgroundColor = [UIColor clearColor];
    dashboardTable.layer.borderColor = [[UIColor whiteColor]CGColor];
    dashboardTable.layer.borderWidth = 1;
    NSMutableArray *Final_Item_List=[[NSMutableArray alloc]initWithObjects:@"Cell 1",@"Cell 2",@"Cell 3",@"Cell 4",@"Cell 5",@"Cell 6",@"Cell 7",@"Cell 8",@"Cell 9", nil];
    dashboardTable.tableCellViewLabels=Final_Item_List ;
    [self.view addSubview:dashboardTable];
    
    self.view.backgroundColor=[UIColor colorWithRed:210/255.0 green:215/255.0 blue:220/255.0 alpha:1.0];
    
    UILabel *Heading =[[UILabel alloc]initWithFrame:CGRectMake(80, 40, 200, 20)];
    
    Heading.text=@"Custom Table View" ;
    
  
    Heading.backgroundColor=[UIColor clearColor];
    
    
    [self.view addSubview:Heading];
}


- (void) customizeCell: (CommentTableCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    cell.ytdTextField.hidden = NO;
    [cell.viewForBottomSection addSubview:label];
    
    label.text=[NSString stringWithFormat:@"Add data for Cell %d Here",indexPath.row+1];
    label.backgroundColor=[UIColor clearColor];

    
    cell.viewForBottomSection.layer.borderColor=[[UIColor blackColor]CGColor];
    cell.viewForBottomSection.layer.borderWidth=1;
    
    cell.viewForBottomSection.backgroundColor=[UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
    
    
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}




- (NSInteger)   customizeNumberOfRowsInSection:(NSInteger)section
{
    
    return 9;
    
}


- (void) customizeCollapsedCell: (CommentTableCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.commentTextLabel.textColor = [UIColor whiteColor];
    
}

- (CGFloat) customizeHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165.0 + 23;
}

- (void)customizeDidSelectCollapsedRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  btnConfigure.hidden = NO;
    
}

- (void)customizeDidSelectExpandedRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  [mValTypeDropDownView removeFromSuperview];
    //   mValTypeDropDownView = nil;
    //   btnPlusMinus = nil;
    // CellIndex=indexPath.row;
    
    // CommentTableCell *cell = (CommentTableCell *)[dashboardTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedIndex inSection:0]];
    
    
}

@end
