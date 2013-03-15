//
//  NewsParsing.m
//  VirtualTownSquare
//
//  Created by Vincent Ngo on 3/13/13.
//  Copyright (c) 2013 Vincent Ngo. All rights reserved.
//

//Defining a contant for the background queue, so collecting the data will be run in the background...


#import "NewsParsing.h"
#import "NewsArticle.h"

@implementation NewsParsing

//What am I trying to retrieve from this JSON data file? 

//Image if any:

//The Date:.....

//vts.cs.vt.edu/system/images/"id"/original/"image_file_name"
// Or just get the "image_src"
//"vts.cs.vt.edu/" + "image_src"

//"source_url" the original articule from webview...

// "description"

//Check to see if image_src value is empty or nil
//Implementation of the Quad Tree, to find locations near by?


//For one Entry

/**
 2013-03-13 20:08:47.763 item at 0 is {
 comments =     (
 );
 "created_at" = "2013-03-13T19:43:11Z";
 description = "<div><div>  Auburn musician earns spot in state performance    <p> Posted March 13 2013</p>     <div><p>Auburn High School\U2019s Max Tomlin will perform with the All-State band on April 4 at Harrisonburg High School. Photo by Travis Williams/The Burgs</p></div><p>RINER \U2014 Max Tomlin will soon travel where no Eagle has flown in nearly a decade.</p><p>On April 4 the Auburn High School junior will join the top high school musicians in the commonwealth for the 2013 Virginia Band and Orchestra Directors Association All-State Band concert in Harrisonburg.</p><p>It will be the first time in Auburn band instructor Sharon Anderson\U2019s eight-year tenure at the school that a representative from Auburn will be in the state\U2019s top-level performance.</p><p>Tomlin who has played the euphonium since the sixth grade qualified for an All-State audition each of his three years in high school by rating as one of the top two performances in District 6 Anderson said.</p><p>The first two years Tomlin said he felt nervous and warmed up for too long prior to the audition. But this year was different.</p><p>\U201cI practiced a lot more and I was more confident when I went so I was nowhere near as nervous. And I really only practiced warmed up for about five minutes\U201d Tomlin said.</p><p>Tomlin\U2019s laid-back approach paid off as he scored as the ninth-best baritone player in the state. All top 10 scorers qualify to participate in the All-State concert.</p><p>The achievement came as no surprise to Anderson who said anyone who has watched the student perform knows that he pours his heart into his music.</p><p>\U201cHe has said from the beginning of this school year that his goal was to make it into the state band this year. \U2026 Only Max\U2019s mom could be more proud of Max than I am\U201d Anderson said.</p><p>Though **** be playing with many musicians he\U2019s never even met Tomlin said he\U2019s excited to hear the music they will produce together.</p><p>\U201cAt district it\U2019s just amazing how good I think people are. \U2026 We all sound phenomenal in the band. \U2026 And at state I can\U2019t even imagine\U201d Tomlin said.</p>          </div><p>No comments yet.</p></div>";
 "external_popularity" = 0;
 "fb_comments_count" = 0;
 "fb_id" = "<null>";
 "fb_likes_count" = 0;
 "fb_link" = "<null>";
 "fb_type" = "<null>";
 id = 197313;
 "image_content_type" = "image/jpeg";
 "image_file_name" = "open-uri20130313-19750-cm65u5";
 "image_file_size" = 15890;
 "image_src" = "/system/images/197313/thumb/open-uri20130313-19750-cm65u5?1363203788";
 "image_updated_at" = "2013-03-13T19:43:08Z";
 "image_url" = "<null>";
 kind = 2;
 latitude = "36.8338872";
 longitude = "-76.4211478";
 popularity = 0;
 "published_at" = "2013-03-13T14:16:06Z";
 "related_story_id" = "<null>";
 source = "The Burgs Blog";
 "source_url" = "http://blogs.roanoke.com/theburgs/schools/2013/03/13/auburn-musician-earns-spot-in-state-performance/";
 title = "Auburn musician earns spot in state performance";
 "topic_id" = 11910;
 "tweets_count" = 0;
 "twitter_id" = "<null>";
 "twitter_retweet_count" = 0;
 "updated_at" = "2013-03-13T22:53:30Z";
 url = "<null>";
 user = "<null>";
 "user_email_hash" = "<null>";
 "user_id" = "<null>";
 views = 3;
 votes =     (
 );
 }
 
 
 */

- (NSMutableArray *)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    
    NSArray* json = [NSJSONSerialization
                          JSONObjectWithData:responseData 
                          
                          options:kNilOptions
                          error:&error];
    
    
    self.listOfNewsArticleToJSON = json;
    self.listOfNewsArticles = [[NSMutableArray alloc]init];
    
    //Loop through each news article's json data, and create a new
    //newsArticle object to store the data we extract.
    for (int i = 0; i < self.listOfNewsArticleToJSON.count; i++){
        
        self.oneNewsArticleToJSONData = [self.listOfNewsArticleToJSON objectAtIndex:i];
        
        //Getting the different fields we want from JSON Data
        
        //Need to convert the date somehow...
        NSString *theStringDateFormat = [self.oneNewsArticleToJSONData objectForKey:@"created_at"];
        
        
        NSString *theTitle = [self.oneNewsArticleToJSONData objectForKey:@"title"];
        NSString *theDescriptionHtml = [self.oneNewsArticleToJSONData objectForKey:@"description"];
        NSString *theOriginalArticleSource = [self.oneNewsArticleToJSONData objectForKey:@"source_url"];
        
        NSString *theImageSrc = [self.oneNewsArticleToJSONData objectForKey:@"image_src"];
        
        //NSLog(@"image source %@", theImageSrc);
        
        NSString *theFullImageUrl = [NSString stringWithFormat:@"http://vts.cs.vt.edu%@",theImageSrc];
        


        NewsArticle *anArticle = [[NewsArticle alloc]initTitle:theTitle theDescription:theDescriptionHtml theimageURL: theFullImageUrl theOriginalSource:theOriginalArticleSource ];//] theimageData:image];
        [self.listOfNewsArticles addObject:anArticle];

        
        NSLog(@"the full image url %@", theFullImageUrl);
        
        //Create a new news article 
       // NewsArticle *anArticle = [[NewsArticle alloc]initTitle:theTitle theDescription:theDescriptionHtml theimageURL: theFullImageUrl theOriginalSource:theOriginalArticleSource theimageData:image];
        
       
        
    }
    

    
    return self.listOfNewsArticles;
    //Done for tonight...
    //Questions to answer for tomorrow:
    // Removing the html tags in the description
    //Are you storing each of these fields in the news article object?
    


    


    
    
}










@end
