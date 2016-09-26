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

@implementation VideoPlayer

- (void)showVideoPlayer
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *view = [[UIView alloc] initWithFrame:window.frame];
    view.backgroundColor = [UIColor whiteColor];
    
    float height = window.frame.size.width * 9 / 16;
    
    PlayerView *videoView = [[PlayerView alloc] initWithFrame:CGRectMake(0, 0, window.frame.size.width, height)];

    [view addSubview:videoView];
    
    [window addSubview:view];
    view.frame = CGRectMake(window.frame.size.width - 10, window.frame.size.height - 10, 10, 10);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        view.frame = window.frame;
    } completion:^(BOOL finished) {
        
    }];
    
}

@end
