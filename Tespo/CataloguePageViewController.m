//
//  CataloguePageViewController.m
//  Tespo
//
//  Created by Basar Akyelli on 2/21/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "CataloguePageViewController.h"
#import <UIImageView+AFNetworking.h>
@interface CataloguePageViewController ()

@end

@implementation CataloguePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"This got called");
    
      UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
     [self.view addSubview:imageView];
    [imageView setImageWithURL:[NSURL URLWithString:self.pageURLString]];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
