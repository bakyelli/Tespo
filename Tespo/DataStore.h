//
//  DataStore.h
//  Tespo
//
//  Created by Basar Akyelli on 1/11/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Store.h"
#import "Catalogue.h" 

@interface DataStore : NSObject

+ (DataStore *)SharedStore;

-(void) getAllStoresWithCompletion:(void (^) (NSMutableArray *)) completion;
-(void) getCurrentCatalogueWithCompletion:(void (^) (Catalogue *)) completion;

@end
