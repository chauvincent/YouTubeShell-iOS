//
//  VideoPlayer.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/25/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "VideoPlayer.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerView : UIView


@end

@implementation PlayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
        NSString *url = @"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4";
        NSURL *videoUrl = [NSURL URLWithString:url];
        
        AVPlayer *player = [[AVPlayer alloc] initWithURL:videoUrl];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        playerLayer.frame = self.frame;
        [self.layer addSublayer:playerLayer];

        [player play];

        
        
    }
    return self;
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        
    }
    return self;
}

@end

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

- (void)setupView
{
    
}


@end
