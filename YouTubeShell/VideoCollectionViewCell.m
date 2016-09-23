//
//  VideoCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "VideoCollectionViewCell.h"

@implementation VideoCollectionViewCell

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = false;
        _imageView.backgroundColor = [UIColor blueColor];

        
    }
    return _imageView;
}

- (UIView *)separator
{
    if (!_separator)
    {
        _separator = [[UIView alloc] init];
        _separator.translatesAutoresizingMaskIntoConstraints = false;
        _separator.backgroundColor = [UIColor blackColor];
    }
    
    return _separator;
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

- (void)setupView
{
    [self addSubview:self.imageView];
    [self addSubview:self.separator];
    
    self.imageView.frame = CGRectMake(0, 0, 100, 100);
    self.backgroundColor = [UIColor greenColor];

    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-16-[v0]-16-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"v0":self.imageView}]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-16-[v0]-16-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"v0":self.imageView}]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[v0]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"v0":self.separator}]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[v0(1)]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"v0":self.separator}]];
    
}



@end
