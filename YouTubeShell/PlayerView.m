//
//  PlayerView.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/26/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "PlayerView.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


#pragma mark - PlayerView Class
BOOL isPlaying = false;

@interface PlayerView()

@property (strong, nonatomic) UIView *buttonContainerView;
@property (strong, nonatomic) UIActivityIndicatorView *indicator;
@property (strong, nonatomic) UIButton *pauseBtn;
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) UILabel *playBackLabel;
@property (strong, nonatomic) UISlider *slider;
@property (strong, nonatomic) UILabel *currentTimeLabel;
@end

@implementation PlayerView

- (UISlider *)slider
{
    if (!_slider)
    {
        _slider = [[UISlider alloc] init];
        _slider.translatesAutoresizingMaskIntoConstraints = false;
        _slider.minimumTrackTintColor = [UIColor redColor];
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_slider setThumbImage:[UIImage imageNamed:@"thumb"] forState:UIControlStateNormal];
    }
    
    return _slider;
}


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

- (UILabel *)playBackLabel
{
    if (!_playBackLabel)
    {
        _playBackLabel = [[UILabel alloc] init];
        _playBackLabel.text = @"00:00";
        _playBackLabel.textColor = [UIColor whiteColor];
        _playBackLabel.font = [UIFont boldSystemFontOfSize:14.0];
        _playBackLabel.textAlignment = NSTextAlignmentRight;
        _playBackLabel.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    return _playBackLabel;
}

- (UILabel *)currentTimeLabel
{
    if (!_currentTimeLabel)
    {
        _currentTimeLabel = [[UILabel alloc] init];
        _currentTimeLabel.text = @"00:00";
        _currentTimeLabel.textColor = [UIColor whiteColor];
        _currentTimeLabel.font = [UIFont boldSystemFontOfSize:14.0];
        _currentTimeLabel.textAlignment = NSTextAlignmentLeft;
        _currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    return _currentTimeLabel;
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
        
        
        [self.buttonContainerView addSubview:self.playBackLabel];
        [self.playBackLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-8].active = true;
        [self.playBackLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
        [self.playBackLabel.widthAnchor constraintEqualToConstant:60].active = true;
        [self.playBackLabel.heightAnchor constraintEqualToConstant:30].active = true;
        
        [self.buttonContainerView addSubview:self.currentTimeLabel];
        [self.currentTimeLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:8].active = true;
        [self.currentTimeLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
        [self.currentTimeLabel.widthAnchor constraintEqualToConstant:60].active = true;
        [self.currentTimeLabel.heightAnchor constraintEqualToConstant:30].active = true;
        
        [self.buttonContainerView addSubview:self.slider];
        [self.slider.rightAnchor constraintEqualToAnchor:self.playBackLabel.leftAnchor].active = true;
        [self.slider.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
        [self.slider.leftAnchor constraintEqualToAnchor:self.currentTimeLabel.rightAnchor].active = true;
        [self.slider.heightAnchor constraintEqualToConstant:30].active = true;
        
        UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
        swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
        swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
        
        [self addGestureRecognizer:swipeDown];
        [self addGestureRecognizer:swipeUp];
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
    NSString *url = @"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_5mb.mp4";
    NSURL *videoUrl = [NSURL URLWithString:url];
    self.player = [[AVPlayer alloc] initWithURL:videoUrl];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame = self.frame;
    [self.layer addSublayer:playerLayer];
    [self.player play];
    [self.player addObserver:self forKeyPath:@"currentItem.loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    __weak typeof(self) weakSelf = self;
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 2) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSUInteger currentTotalSeconds = CMTimeGetSeconds(time);
        NSUInteger currentMinutes = floor(currentTotalSeconds % 3600 / 60);
        NSUInteger currentSeconds = floor(currentTotalSeconds % 3600 % 60);
        NSString *videoCurrentText = [NSString stringWithFormat:@"%02lu:%02lu", (unsigned long)currentMinutes, (unsigned long)currentSeconds];
        weakSelf.currentTimeLabel.text = videoCurrentText;
        weakSelf.slider.value = (float)(currentTotalSeconds / CMTimeGetSeconds(weakSelf.player.currentItem.duration));
    }];
    
    
    
    // Dim background
    CAGradientLayer *gradLayer = [[CAGradientLayer alloc] init];
    gradLayer.colors = @[[UIColor clearColor], [UIColor blackColor]];
    gradLayer.locations = @[@0.6, @1.1];
    [self.buttonContainerView.layer addSublayer:gradLayer];
    
}

- (void)sliderValueChanged:(id)sender
{
    CMTime duration = self.player.currentItem.duration;
    NSUInteger seconds = CMTimeGetSeconds(duration);
    float value = (Float64)self.slider.value * seconds;
    
    CMTime seekTime = CMTimeMake(value, 1);
    [self.player seekToTime:seekTime completionHandler:^(BOOL finished) {
        
    }];
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
        CMTime time = self.player.currentItem.duration;
        NSUInteger dTotalSeconds = CMTimeGetSeconds(time);
        NSUInteger dMinutes = floor(dTotalSeconds % 3600 / 60);
        NSUInteger dSeconds = floor(dTotalSeconds % 3600 % 60);
        NSString *videoDurationText = [NSString stringWithFormat:@"%02lu:%02lu", (unsigned long)dMinutes, (unsigned long)dSeconds];
        self.playBackLabel.text = videoDurationText;
        
        if ([keyPath isEqualToString:@"currentItem.loadedTimeRanges"])
        {
            [self.indicator stopAnimating];
            self.pauseBtn.hidden = false;
            isPlaying = true;
        }
        else
        {
            isPlaying = false;
        }
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (void)swipeUp:(UIGestureRecognizer *)gesture
{
    NSLog(@"did swipe up");
    [self minimizePlayer:NO animated:YES];
}

- (void)swipeDown:(UIGestureRecognizer *)gesture
{
    NSLog(@"did swipe down");
    [self minimizePlayer:YES animated:YES];
}


- (BOOL)isMinimized
{
    NSLog(@"current origin of Y is %f", self.frame.origin.y);
    return self.frame.origin.y > 0;
}

- (void)minimizePlayer:(BOOL)minimized animated:(BOOL)animated
{
    if([self isMinimized] == minimized)
    {
        NSLog(@"return block called");
        return;
    }
    
    CGRect tallContainerFrame, containerFrame;
    CGFloat tallContainerAlpha;
    
    if (minimized)
    {
        NSLog(@"minimizeded = true ");
        CGFloat minWidth = 160;
        CGFloat minHeight = 90;
        CGFloat x = 320 - minWidth;
        CGFloat y = self.bounds.size.height - minHeight;
        tallContainerFrame = CGRectMake(x, y, 320, self.bounds.size.height);
        containerFrame = CGRectMake(x, y, minWidth, minHeight);
        tallContainerAlpha = 0.0;
    }
    else
    {
        NSLog(@"else branch");
        tallContainerFrame = self.bounds;
        containerFrame = CGRectMake(0, 0, 320, 180);
        tallContainerAlpha = 1.0;
    }
    
    NSTimeInterval duration = (animated)? 0.5 : 0.0;
    
    [UIView animateWithDuration:duration animations:^{
        self.frame = tallContainerFrame;
        self.frame = containerFrame;
        self.alpha = tallContainerAlpha;
    }];
}
@end
