//
//  DataStore.m
//  Tespo
//
//  Created by Basar Akyelli on 1/11/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+ (DataStore *)SharedStore {
    static DataStore *sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataStore = [[self alloc] init];
    });
    return sharedDataStore;
}

-(void) getAllStoresWithCompletion:(void (^) (NSMutableArray *)) completion;
{
    
    PFQuery *query = [[PFQuery alloc]initWithClassName:@"Stores"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error)
        {
            NSMutableArray *stores = [NSMutableArray new];
            
            for(PFObject *object in objects){
                Store *store = [[Store alloc]initWithParseObject:object];
                [stores addObject:store];
            }
            
            completion(stores);
        }
    }];
    
}

@end
