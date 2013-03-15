//
//  NewsCustomCell.h
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/14/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCustomCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionLabel;

@end
