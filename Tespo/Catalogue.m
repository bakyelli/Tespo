//
//  Catalogue.m
//  Tespo
//
//  Created by Basar Akyelli on 2/21/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "Catalogue.h"

@implementation Catalogue


-(id)initWithParseObject:(PFObject *)object
{
    self = [super init];
    
    if(self)
    {
        _catalogueName = object[@"CatalogueName"];
        _catalogueStartDate = object[@"CatalogueStartDate"];
        _catalogueEndDate = object[@"CatalogueEndDate"];
        _cataloguePagesURLs = object[@"CataloguePageURLs"];
        _cataloguePages = [_cataloguePagesURLs componentsSeparatedByString:@";"];
        
    }
    return self;
    
}

@end
