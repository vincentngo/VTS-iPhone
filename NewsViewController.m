//
//  NewsViewController.m
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/11/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import "NewsViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h" 
#import "NewsCustomCell.h"
#import "NewsArticle.h"

#import "asyncimageview.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 

#define kNEWSJsonURL [NSURL URLWithString: @"http://vts.cs.vt.edu/search.json?type=2&page=2"] 

@interface NewsViewController ()

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    self.newsParser = [[NewsParsing alloc]init];
    
        //Grab the data from this url.
        NSData* data = [NSData dataWithContentsOfURL:
                        kNEWSJsonURL];
        
        self.listofNewsArticles = [self.newsParser fetchedData:data];

    
    NSLog(@"size of news article is : %d", self.listofNewsArticles.count);




    //================ECSliding=============
    
    //Adds a shadow to give a view controller hovering over the menu.
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
  
    //Checks to see if the menu view controller is under the view.
    //if it doesn't have it, then we will make a menu view.
    if(![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    //Adds a sliding gesture, swiping left to right to see menu.
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
}



#pragma mark - Table View Data Source Methods

// Asks the data source to return the number of sections in the table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


// Asks the data source to return the number of rows in a section, the number of which is given

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
  return [self.listofNewsArticles count];
    
}


// Asks the data source to return a cell to insert in a particular table view location

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //Gets the current news article
    NewsArticle *theCurrentArticle = [self.listofNewsArticles objectAtIndex:[indexPath row]];
    
    //Gets the title from the current article
    NSString *theTitle = theCurrentArticle.title;
    
    //Gets the image url 
    NSString *imageUrl = theCurrentArticle.imageURL;
    
    //Gets the description of the current news article
    NSString *theDescription = theCurrentArticle.description;
    
    
    NewsCustomCell *cell = (NewsCustomCell *)[tableView dequeueReusableCellWithIdentifier:@"NewsContent"];
    
    if (cell == nil) {
        cell = (NewsCustomCell *)[tableView dequeueReusableCellWithIdentifier:@"NewsContent"];
    } else {
        AsyncImageView* oldImage = (AsyncImageView*)[cell.contentView viewWithTag:999];
        [oldImage removeFromSuperview];
    }

    
    
    AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
    imageView.tag = 999;

    [imageView loadImageFromURL:[NSURL URLWithString:imageUrl]];
    [cell.contentView addSubview:imageView];
              
              cell.titleLabel.text = theTitle;
              cell.descriptionLabel.text = theDescription;
              cell.imageLabel.contentMode = UIViewContentModeScaleAspectFill;

    return cell;
    

   
}


#pragma mark - Table View Delegate Methods

// Tells the delegate (=self) that the row specified under indexPath is now selected.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
   }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
