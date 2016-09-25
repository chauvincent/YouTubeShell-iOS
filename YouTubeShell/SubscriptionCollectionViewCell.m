//
//  SubscriptionCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "SubscriptionCollectionViewCell.h"
#import "Video.h"

@implementation SubscriptionCollectionViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)loadFakeData
{
    Video *vid1 = [[Video alloc] initWithTitle:@"Subscription Video 3" withImageName:@"nyan-cat" andAuthor:@"Nyan Cat Fans" andViewCount:@"3,000,000 views"];
    
    Video *vid2 = [[Video alloc] initWithTitle:@"Subscription Video 2" withImageName:@"vegeta" andAuthor:@"Dragon Ball Z Fans" andViewCount:@"9,000 views"];
    
    Video *vid3 = [[Video alloc] initWithTitle:@"Subscription Video 1" withImageName:@"nyan-cat-race" andAuthor:@"Nyan Cat Fans" andViewCount:@"8,000,000 views"];
    
    self.videos = [@[vid3, vid2, vid1] mutableCopy];
}

@end
