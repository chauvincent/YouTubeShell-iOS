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


#pragma mark - PlayerView Class
BOOL isPlaying = false;

@interface PlayerView : UIView

@property (strong, nonatomic) UIView *buttonContainerView;
@property (strong, nonatomic) UIActivityIndicatorView *indicator;
@property (strong, nonatomic) UIButton *pauseBtn;
@property (strong, nonatomic) AVPlayer *player;

@end

@implementation PlayerView

- (UIActivityIndicatorView *)indicator
{
    if (!_indicator)
    {
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _indicator.translatesAutoresizingMaskIntoConstraints = false;
        [_indicator startAnimating];
    }
    return _indicator;
}

- (UIView *)buttonContainerView
{
    if (!_buttonContainerView)
    {
        _buttonContainerView = [[UIView alloc] init];
        _buttonContainerView.backgroundColor = [UIColor clearColor];
    }
 
    return _buttonContainerView;
}

- (UIButton *)pauseBtn
{
    if (!_pauseBtn)
    {
        _pauseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_pauseBtn setImage:[UIImage imageNamed:@"pause_btn"] forState:UIControlStateNormal] ;
        _pauseBtn.translatesAutoresizingMaskIntoConstraints = false;
        _pauseBtn.tintColor = [UIColor whiteColor];
        _pauseBtn.hidden = true;
        [_pauseBtn addTarget:self action:@selector(pauseBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _pauseBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {

        [self setupView];
        self.buttonContainerView.frame = self.frame;
        [self addSubview:self.buttonContainerView];
        
        [self.buttonContainerView addSubview:self.indicator];
        [self.indicator.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = true;
        [self.indicator.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
        

        [self.buttonContainerView addSubview:self.pauseBtn];
        [self.pauseBtn.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = true;
        [self.pauseBtn.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
        [self.pauseBtn.widthAnchor constraintEqualToConstant:50].active = true;
        [self.pauseBtn.heightAnchor constraintEqualToConstant:50].active = true;
        
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

- (void)setupView
{
    self.backgroundColor = [UIColor blackColor];
    NSString *url = @"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4";
    NSURL *videoUrl = [NSURL URLWithString:url];
    self.player = [[AVPlayer alloc] initWithURL:videoUrl];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame = self.frame;
    [self.layer addSublayer:playerLayer];
    [self.player play];
    
    [self.player addObserver:self forKeyPath:@"currentItem.loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)pauseBtnPressed:(id)sender
{
    if (isPlaying)
    {
        [self.player pause];
        [self.pauseBtn setImage:[UIImage imageNamed:@"play_btn"] forState:UIControlStateNormal];
    }
    else
    {
        [self.player play];
        [self.pauseBtn setImage:[UIImage imageNamed:@"pause_btn"] forState:UIControlStateNormal];
    }
    isPlaying = !isPlaying;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == nil)
    {
        if ([keyPath isEqualToString: @"currentItem.loadedTimeRanges"])
        {
            [self.indicator stopAnimating];
            self.pauseBtn.hidden = false;
            isPlaying = true;
        }
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end

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
