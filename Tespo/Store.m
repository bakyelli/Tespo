//
//  Store.m
//  Tespo
//
//  Created by Basar Akyelli on 1/11/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "Store.h"

@implementation Store


-(id)initWithParseObject:(PFObject *)object
{
    self = [super init];
    
    if(self)
    {
        _storeName = object[@"StoreName"];
        _storeAddress = object[@"StoreAddress"];
        _storeDistrict = object[@"StoreDistrict"];
        _storeCity = object[@"StoreCity"];
        _storePhoneNumber = object[@"StorePhone"];
        _storeFAXNumber = object[@"StoreFax"];
        _storeEmailAddress = object[@"StoreEmail"];
        
        PFGeoPoint *storeLocation = object[@"StoreLocation"];
        _storeCoordinates = CLLocationCoordinate2DMake(storeLocation.latitude, storeLocation.longitude);
        
        _storeMainImageURL = object[@"StoreImageMain"];
        
    }
    return self;
    
}
@end
