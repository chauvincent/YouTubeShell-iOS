//
//  SlideMenuCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "SlideMenuCollectionViewCell.h"
#import "UIView+Constraints.h"

@interface SlideMenuCollectionViewCell()

@property (strong, nonatomic) UILabel *settingsNameLabel;
@property (strong, nonatomic) UIImageView *imageView;

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

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [[UIImage imageNamed:@"settings_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_imageView setTintColor:[UIColor grayColor]];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = true;
    }
    
    return _imageView;
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
    [self addSubview:self.settingsNameLabel];
    [self addSubview:self.imageView];
    
    [self addVisualConstraintWithFormat:@"H:|-16-[v0(30)]-16-[v1]|" andView:@[self.imageView, self.settingsNameLabel]];
    [self addVisualConstraintWithFormat:@"V:|[v0]|" andView:@[self.settingsNameLabel]];
    [self addVisualConstraintWithFormat:@"V:[v0(30)]" andView:@[self.imageView]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:10.0]];
    
}

@end
