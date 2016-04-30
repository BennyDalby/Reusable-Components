//
//  CommentTableCell.h
//  ExpandingTableViewProject
//
//  Created by Ryan Newsome on 4/13/11.
//

#import <UIKit/UIKit.h>
//#import "BODropDownView.h"

@interface CommentTableCell : UITableViewCell
{
    IBOutlet UILabel *commentTextLabel;
    IBOutlet UIImageView *toggleImage;
    IBOutlet UIView *viewForTopSection;
    
    IBOutlet UIView *viewForBottomSection;
   // IBOutlet UITextField    *ytdTextField;
    
   // BODropDownView              *mValTypeDropDownView;
    NSArray                     *mValTypeList;
}

@property(nonatomic,retain)IBOutlet UILabel         *commentTextLabel;
@property(nonatomic,retain)IBOutlet UIImageView     *toggleImage;
@property(nonatomic,retain)IBOutlet UIView          *viewForTopSection;
@property(nonatomic,retain)IBOutlet UIView          *viewForBottomSection;

@property(nonatomic,retain)IBOutlet UITextField     *ytdTextField;


@end
