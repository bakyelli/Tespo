//
//  CatalogueViewController.m
//  Tespo
//
//  Created by Basar Akyelli on 2/21/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "CatalogueViewController.h"
#import <UIImageView+AFNetworking.h> 
#import "CataloguePageViewController.h" 

@interface CatalogueViewController ()
@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *cataloguePages;
@end

@implementation CatalogueViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[DataStore SharedStore] getCurrentCatalogueWithCompletion:^(Catalogue *catalogue) {
        
        self.cataloguePages = catalogue.cataloguePages;
        
        self.pageController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                             navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        
        self.pageController.dataSource = self; 
        [self.pageController.view setFrame:self.view.bounds];
        
        CataloguePageViewController *pageVC = [self viewControllerAtIndex:0];
        
        NSArray *viewControllers = [NSArray arrayWithObject:pageVC];
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        
        [self addChildViewController:self.pageController];
        [self.view addSubview:self.pageController.view];
        [self.pageController didMoveToParentViewController:self];
        
    }];
	// Do any additional setup after loading the view.
}

- (CataloguePageViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    CataloguePageViewController *childViewController = [[CataloguePageViewController alloc] init];
    childViewController.pageURLString = self.cataloguePages[index];
    childViewController.index = index;
    return childViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    CataloguePageViewController *vc = (CataloguePageViewController *)viewController;
    NSUInteger index = vc.index;
    
    if (index == 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    CataloguePageViewController *vc = (CataloguePageViewController *)viewController;
    NSUInteger index = vc.index;
    
    if (index == self.cataloguePages.count-1) {
        return nil;
    }
    
    index++;
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return self.cataloguePages.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
  
}
-(BOOL)prefersStatusBarHidden{
    return YES; 
}


@end
