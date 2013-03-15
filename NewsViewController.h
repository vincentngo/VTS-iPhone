//
//  NewsViewController.h
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/11/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsParsing.h"

@interface NewsViewController : UIViewController

@property (nonatomic, strong) NewsParsing *newsParser;
@property (nonatomic, strong) NSMutableArray *listofNewsArticles;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *news;
@property (strong, nonatomic) NSMutableData *data;


@property (nonatomic, strong) NSArray *listOfNewsArticleToJSON;
@property (nonatomic, strong) NSDictionary *oneNewsArticleToJSONData;



@property int test;



@property (nonatomic, strong) NSMutableArray *imageUrls;


@end
