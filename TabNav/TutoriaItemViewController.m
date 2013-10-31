//
//  TutoriaItemViewController.m
//  TabNav
//
//  Created by silentcloud on 10/31/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "TutoriaItemViewController.h"
#import "TabNavAppDelegate.h"

@implementation TutoriaItemViewController

@synthesize index = _index;
@synthesize imageContainer = _imageContainer;

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.imageContainer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.imageContainer.backgroundColor = [UIColor clearColor];
    NSString *imageString = [NSString stringWithFormat:@"guide0%i",self.index + 1];
    self.imageContainer.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageString ofType:@"png"]];
    [self.view addSubview:self.imageContainer];
    if (self.index == 3) {
        UIButton *enterBtn = [[UIButton alloc] initWithFrame:CGRectMake(43, 328, 240, 42)];
        [enterBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [enterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [enterBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        //[enterBtn setBackgroundImage:[[UIImage imageNamed:@"btn-login.png"] stretchableImageWithLeftCapWidth:12.5 topCapHeight:0.0] forState:UIControlStateNormal];
        [enterBtn addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:enterBtn];
    }
}

- (void)enter
{
    [(TabNavAppDelegate *)[UIApplication sharedApplication].delegate loadMainView];
    self.view = nil;
}

- (void)viewDidUnload {
    [self setImageContainer:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
