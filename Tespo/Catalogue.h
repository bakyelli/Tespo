//
//  Catalogue.h
//  Tespo
//
//  Created by Basar Akyelli on 2/21/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Catalogue : NSObject

@property (strong, nonatomic) NSString *catalogueName;
@property (strong, nonatomic) NSDate *catalogueStartDate;
@property (strong, nonatomic) NSDate *catalogueEndDate;
@property (strong, nonatomic) NSString *cataloguePagesURLs;
@property (strong, nonatomic) NSArray *cataloguePages;

-(id)initWithParseObject:(PFObject *)object;

@end
