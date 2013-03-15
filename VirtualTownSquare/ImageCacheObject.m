//
//  ImageCacheObject.m
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/15/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import "ImageCacheObject.h"

@implementation ImageCacheObject

@synthesize size;
@synthesize timeStamp;
@synthesize image;

-(id)initWithSize:(NSUInteger)sz Image:(UIImage*)anImage
{
    if (self = [super init])
    {
        size = sz;
//        timeStamp = [[NSDate date] retain];
//        image = [anImage retain];
    }
    return self;
}

-(void)resetTimeStamp
{
//    [timeStamp release];
//    timeStamp = [[NSDate date] retain];
}

-(void) dealloc
{
//    [timeStamp release];
//    [image release];
//    [super dealloc];
}


//http://www.scoop.it/t/ios-developing
@end
