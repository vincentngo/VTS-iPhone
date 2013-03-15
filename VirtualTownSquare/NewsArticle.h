//
//  NewsArticle.h
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/13/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsArticle : NSObject

//Image if any:

//vts.cs.vt.edu/system/images/"id"/original/"image_file_name"
// Or just get the "image_src"
//"vts.cs.vt.edu/" + "image_src"

//"source_url" the original articule from webview...

// "description"

//Check to see if image_src value is empty or nil

@property (nonatomic, strong)NSString *imageURL;
@property (nonatomic, strong)NSString *description;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *articleSource;
@property (nonatomic, strong)UIImage *imageData;


- (id)initTitle: (NSString *)title theDescription:(NSString *)description theimageURL:(NSString *) imageUrl theOriginalSource:(NSString *)articleSource;// theimageData:(UIImage *)imageData;



@end
