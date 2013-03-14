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

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 

#define kNEWSJsonURL [NSURL URLWithString: @"http://vts.cs.vt.edu/search.json?type=2&page=1"] 

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
    
    self.newsParser = [[NewsParsing alloc]init];

    //This collects all the news articles in Virtual Town Square. The job is done in the background thread so it doesn't intervene with UI
    dispatch_async(kBgQueue, ^{
        //Grab the data from this url.
        NSData* data = [NSData dataWithContentsOfURL:
                        kNEWSJsonURL];
        //
        //        [self performSelectorOnMainThread:@selector(fetchedData:)
        //                           withObject:data waitUntilDone:YES];
        
        [self.newsParser fetchedData:data];
    });

    
    
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
