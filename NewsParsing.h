//
//  NewsParsing.h
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/13/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsParsing : NSObject

@property (nonatomic, strong) NSArray *listOfNewsArticleToJSON;
@property (nonatomic, strong) NSDictionary *oneNewsArticleToJSONData;

//a changable array that stores news article objects
@property (nonatomic, strong) NSMutableArray *listOfNewsArticles;

@property (nonatomic, strong) NSMutableArray *imageUrls;

- (NSMutableArray *)fetchedData:(NSData *)responseData;

- (NSMutableArray *)fetchedImageData:(NSData *)responseData;
@end
