//
//  VideoCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "VideoCollectionViewCell.h"
#import "UIView+Constraints.h"

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

    
    [self addVisualConstraintWithFormat:@"H:|-16-[v0]-16-|" andView:@[self.imageView]];
    [self addVisualConstraintWithFormat:@"V:|-16-[v0]-16-|" andView:@[self.imageView]];
    [self addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[self.separator]];
    [self addVisualConstraintWithFormat:@"V:[v0(1)]|" andView:@[self.separator]];

}



@end
