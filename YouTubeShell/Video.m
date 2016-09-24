//
//  Video.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/23/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "Video.h"

@implementation Video

-(instancetype)initWithTitle:(NSString *)title withImageName:(NSString *)name andAuthor:(NSString*)author andViewCount:(NSString*)count
{
    
    if (self = [super init])
    {
        _title = title;
        _author = author;
        _imageName = name;
        _viewCount = count;
    }
    return self;
}


@end
