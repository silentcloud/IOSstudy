//
//  TutorialViewController.m
//  TabNav
//
//  Created by silentcloud on 10/31/13.
//  Copyright (c) 2013 qiang.mou. All rights reserved.
//

#import "TutorialViewController.h"
#import "TutoriaItemViewController.h"

@implementation TutorialViewController

@synthesize pageController = _pageController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *options = [NSDictionary dictionaryWithObject:
                                [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
                                forKey: UIPageViewControllerOptionSpineLocationKey];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    [self.pageController view].backgroundColor = [UIColor grayColor];
    TutoriaItemViewController *tutorialItem = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:tutorialItem];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}


- (TutoriaItemViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    TutoriaItemViewController *tutorialItem = [[TutoriaItemViewController alloc] init];
    tutorialItem.index = index;
    
    return tutorialItem;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TutoriaItemViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TutoriaItemViewController *)viewController index];
    
    index++;
    
    if (index == 4) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 4;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
