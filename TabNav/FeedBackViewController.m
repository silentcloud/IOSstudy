//
//  FeedBackViewController.m
//  TabNav
//
//  Created by silentcloud on 10/31/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@property (nonatomic, weak) IBOutlet UIView *accessoryView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *doneButton;

@end


@implementation FeedBackViewController

@synthesize textView, numLabel, placeLabel;

-(void) viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1];
    
    self.navigationItem.title = @"反馈";
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"提交"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(clickRightButton)];
    
    rightButton.tintColor = [UIColor whiteColor];
    [rightButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:10], NSFontAttributeName ,nil] forState:UIControlStateNormal];
    //默认禁用提交
    rightButton.enabled = NO;
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 93, 300 ,100)];
    self.textView.textColor = [UIColor blackColor];
    self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];
    self.textView.delegate = self;
    self.textView.scrollEnabled = YES;
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;
    self.textView.layer.borderWidth = 1.0;
    self.textView.layer.cornerRadius = 4.0;
    
    [self.view addSubview:self.textView];
    
    self.placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, 200.0f, 20.0f)];
    self.placeLabel.text = @"写下你遇到的问题或建议";
    self.placeLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    self.placeLabel.textColor = [UIColor grayColor];
    [self.view addSubview:self.placeLabel];
    
    self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(280.0f, 170.0f, 50.0f, 20.0f)];
    self.numLabel.text = @"200";
    self.numLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
    self.numLabel.textColor = [UIColor grayColor];
    
    [self.view addSubview:self.numLabel];
}

//对textView字数限制
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return range.location >= 240 ? NO : YES;
}

//实现UITextView的代理
-(void)textViewDidChange:(UITextView *)textView
{
    if (self.textView.text.length == 0) {
        self.placeLabel.text = @"写下你遇到的问题或建议";
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }else{
        self.placeLabel.text = @"";
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    }
    self.numLabel.text = [NSString stringWithFormat:@"%d", 200 - self.textView.text.length];
}


- (void)clickRightButton
{
    if (self.textView.text.length == 0) {
        return;
    }
    UIAlertView *message = [[UIAlertView alloc]initWithTitle:@"" message:self.textView.text delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
    [message show];
}

- (void)viewWillAppear:(BOOL)animated {
    
    // make the keyboard appear when the application launches
    [super viewWillAppear:animated];
    
    // start editing the UITextView
    [self editAction:self];
}

- (IBAction)editAction:(id)sender {
    
    // user tapped the Edit button, make the text view first responder
    [self.textView becomeFirstResponder];
}

- (IBAction)doneAction:(id)sender {
    
    // user tapped the Done button, release first responder on the text view
    [self.textView resignFirstResponder];
}


@end
