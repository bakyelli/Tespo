//
//  StoreDetailsViewController.h
//  Tespo
//
//  Created by Basar Akyelli on 1/12/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"

@interface StoreDetailsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) Store *selectedStore;

@end
