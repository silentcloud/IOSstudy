//
//  FeedBackViewController.h
//  TabNav
//
//  Created by silentcloud on 10/31/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedBackViewController : UIViewController <UITextViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *placeLabel;
@property (strong, nonatomic) IBOutlet UILabel *numLabel;

@end
