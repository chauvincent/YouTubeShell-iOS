//
//  SlideMenuCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "SlideMenuCollectionViewCell.h"

@interface SlideMenuCollectionViewCell()

@property (strong, nonatomic) UILabel *settingsNameLabel;

@end


@implementation SlideMenuCollectionViewCell

- (UILabel *)settingsNameLabel
{
    if (!_settingsNameLabel)
    {
        _settingsNameLabel = [[UILabel alloc] init];
        _settingsNameLabel.text = @"Settings";
    }
    return _settingsNameLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setupView];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)setupView
{
    [self addSubview:_settingsNameLabel];
}

@end
