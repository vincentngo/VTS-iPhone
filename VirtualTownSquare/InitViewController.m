//
//  InitViewController.m
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/11/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import "InitViewController.h"

@interface InitViewController ()

@end

@implementation InitViewController

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
	// Do any additional setup after loading the view.
    
    //Tells the view controller we want to move our main view to the very top.
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"News"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
