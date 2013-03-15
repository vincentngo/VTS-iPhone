//
//  ImageCache.m
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/15/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import "ImageCache.h"
#import "ImageCacheObject.h"


@implementation ImageCache



@synthesize totalSize;

-(id)initWithMaxSize:(NSUInteger) max
{
    if (self = [super init])
    {
        totalSize = 0;
        maxSize = max;
        myDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}
//
//-(void)dealloc // Don't write this method if you are using ARC
//{
//    [myDictionary release];
//    [super dealloc];
//}

-(void)insertImage:(UIImage*)image withSize:(NSUInteger)sz forKey:(NSString*)key
{
    // NSLog(@"count of insert image%d",sz);
    ImageCacheObject *object = [[ImageCacheObject alloc] initWithSize:sz Image:image];
    while (totalSize + sz > maxSize)
    {
        NSDate *oldestTime;
        NSString *oldestKey;
        for (NSString *key in [myDictionary allKeys])
        {
            ImageCacheObject *obj = [myDictionary objectForKey:key];
            if (oldestTime == nil || [obj.timeStamp compare:oldestTime] == NSOrderedAscending)
            {
                oldestTime = obj.timeStamp;
                oldestKey = key;
            }
        }
        if (oldestKey == nil)
            break; // shoudn't happen
        ImageCacheObject *obj = [myDictionary objectForKey:oldestKey];
        totalSize -= obj.size;
        [myDictionary removeObjectForKey:oldestKey];
    }
    [myDictionary setObject:object forKey:key];
//    [object release];
}

-(UIImage*)imageForKey:(NSString*)key
{
    ImageCacheObject *object = [myDictionary objectForKey:key];
    if (object == nil)
        return nil;
    [object resetTimeStamp];
    return object.image;
}


@end
