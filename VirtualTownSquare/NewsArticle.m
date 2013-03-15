//
//  NewsArticle.m
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/13/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import "NewsArticle.h"

@implementation NewsArticle


//Initalizing data.
- (id)initTitle: (NSString *)title theDescription:(NSString *)description theimageURL:(NSString *) imageUrl theOriginalSource:(NSString *)articleSource //theimageData:(UIImage *)imageData;
{
    self = [super init];
    
    if (self) {
        
        //initializing news article fields
        self.title = title;
        self.imageURL = imageUrl;
        self.description = description;
        self.articleSource = articleSource;
        //self.imageData = imageData;
        
//        NSURL *url = [NSURL URLWithString:imageUrl];
        //Check to see if the article contains a url
//        if (![self.imageURL isEqualToString:@""]){
//            
        
//            NSData *data = [NSData dataWithContentsOfURL:url];
//            
//            self.imageData = [[UIImage alloc]initWithData:data];

//            
//            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageURL]];
//            
//
//            
//            self.imageData = [UIImage imageWithData:imageData];
            
//        }else{
//            
//            self.imageData = nil;
//            
//        }
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.imageURL = nil;
        self.description = nil;
        self.title = nil;
        self.imageData = nil;
    }
    return self;
}

@end
