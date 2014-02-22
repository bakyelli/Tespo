//
//  StoreDetailsViewController.m
//  Tespo
//
//  Created by Basar Akyelli on 1/12/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "StoreDetailsViewController.h"
#import <UIImageView+AFNetworking.h>
#import <FXBlurView.h>

@interface StoreDetailsViewController ()
@property (strong, nonatomic) IBOutlet FXBlurView *blurView;
@property (weak, nonatomic) IBOutlet UIView *detailsView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation StoreDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpGestureRecognizers];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.blurView.blurRadius = 60;

}

-(void)setUpGestureRecognizers
{
    UITapGestureRecognizer *tapToDismiss = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedToDismiss:)];
    [tapToDismiss setNumberOfTapsRequired:1];
    [self.blurView addGestureRecognizer:tapToDismiss];
}
-(void)tappedToDismiss:(UITapGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:nil];
    
    if(!CGRectContainsPoint(self.detailsView.frame, location))
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
  
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImageView *storeImagesView = (UIImageView *) [cell viewWithTag:1];
    
    NSString *pictureURL;
    
    if(indexPath.row == 0)
    {
        pictureURL = @"http://upload.wikimedia.org/wikipedia/commons/f/fb/Turkish.town.cesme.jpg";
    }
    else if(indexPath.row == 1)
    {
     pictureURL = @"http://3.bp.blogspot.com/-Mlx5t18r7J0/UGx8Be7wtwI/AAAAAAAATVk/mDarl7tln9w/s1600/cesme%2Bpeninsula%2Bturkey.jpg";
    }
    else if (indexPath.row == 2)
    {
        pictureURL = @"http://www.turkeypropertyservice.com/wp-content/uploads/cesme61.jpg";
    }
    
    [storeImagesView setImageWithURL:[NSURL URLWithString:pictureURL]];
   // [storeImagesView setImage:[UIImage imageNamed:@"cesme.jpg"]];
    return cell;
    
}

@end
