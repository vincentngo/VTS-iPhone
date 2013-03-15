//
//  ImageCacheObject.h
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/15/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCacheObject : NSObject
{
    NSUInteger size;    // size in bytes of image data
    NSDate *timeStamp;  // time of last access
    UIImage *image;     // cached image
}

@property (nonatomic, readonly) NSUInteger size;
@property (nonatomic, retain, readonly) NSDate *timeStamp;
@property (nonatomic, retain, readonly) UIImage *image;

-(id)initWithSize:(NSUInteger)sz Image:(UIImage*)anImage;
-(void)resetTimeStamp;

@end
