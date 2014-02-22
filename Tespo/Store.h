//
//  Store.h
//  Tespo
//
//  Created by Basar Akyelli on 1/11/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>

@interface Store : NSObject


@property (strong, nonatomic) NSString *storeName;
@property (strong, nonatomic) NSString *storeAddress;
@property (strong, nonatomic) NSString *storeDistrict;
@property (strong, nonatomic) NSString *storeCity;
@property (strong, nonatomic) NSString *storePhoneNumber;
@property (strong, nonatomic) NSString *storeFAXNumber;
@property (strong, nonatomic) NSString *storeEmailAddress;

@property (strong, nonatomic) NSString *storeMainImageURL;
@property (nonatomic) CLLocationCoordinate2D storeCoordinates;

-(id) initWithParseObject:(PFObject *)object;


@end
