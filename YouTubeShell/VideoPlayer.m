//
//  VideoPlayer.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/25/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "VideoPlayer.h"
#import "PlayerView.h"

#pragma mark - VideoPlayer Class

@interface VideoPlayer()

@property (strong, nonatomic) UIView *infoView;

@end

@implementation VideoPlayer

- (void)showVideoPlayer
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    self.infoView = [[UIView alloc] initWithFrame:window.frame];
    self.infoView.backgroundColor = [UIColor whiteColor];
    
    float height = window.frame.size.width * 9 / 16;
    
    PlayerView *videoView = [[PlayerView alloc] initWithFrame:CGRectMake(0, 0, window.frame.size.width, height)];

    [self.infoView addSubview:videoView];
    
    [window addSubview:self.infoView];
    self.infoView.frame = CGRectMake(window.frame.size.width - 10, window.frame.size.height - 10, 10, 10);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.infoView.frame = window.frame;
    } completion:^(BOOL finished) {

        
        
    }];
    
}


@end
