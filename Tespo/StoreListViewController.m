//
//  StoreListViewController.m
//  Tespo
//
//  Created by Basar Akyelli on 1/11/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "StoreListViewController.h"
#import "DataStore.h"
#import <UIImageView+AFNetworking.h>
#import "Store.h"
#import "StoreDetailsViewController.h"

@interface StoreListViewController ()
@property (strong, nonatomic) NSMutableArray *stores;
@end

@implementation StoreListViewController

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
    
    [[DataStore SharedStore]getAllStoresWithCompletion:^(NSMutableArray *results) {
        self.stores = results;
        [self.collectionView reloadData];
    }];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showStoreDetails"])
    {
        StoreDetailsViewController *sdvc = segue.destinationViewController;
        NSIndexPath *selectedItem = self.collectionView.indexPathsForSelectedItems[0];
        Store *selectedStore = (Store *) self.stores[selectedItem.row];
        sdvc.selectedStore = selectedStore;
        
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.stores count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImageView *storeImage = (UIImageView *)[cell viewWithTag:2];
    UILabel *storeName = (UILabel *)[cell viewWithTag:1];
    
    Store *store = self.stores[indexPath.row];
    
    NSURL *storeImageURL = [NSURL URLWithString:store.storeMainImageURL];
    [storeImage setImageWithURL:storeImageURL];
    storeName.text = store.storeName;
    
    return cell;
    
    
}



@end
