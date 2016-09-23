//
//  VideoCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "VideoCollectionViewCell.h"

@implementation VideoCollectionViewCell


- (UIImageView*)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor blueColor];
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

- (void)setupView
{
    [self addSubview:self.imageView];
    self.imageView.frame = CGRectMake(0, 0, 100, 100);
    self.imageView.translatesAutoresizingMaskIntoConstraints = false;
    
    self.backgroundColor = [UIColor greenColor];
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-16-[v0]-16-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"v0":self.imageView}]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-16-[v0]-16-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{@"v0":self.imageView}]];
    
}



@end
