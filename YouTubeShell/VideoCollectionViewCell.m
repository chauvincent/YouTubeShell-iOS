//
//  VideoCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "VideoCollectionViewCell.h"

@interface VideoCollectionViewCell()

@property (strong, nonatomic) NSLayoutConstraint *titleHeightConstraint;

@end

@implementation VideoCollectionViewCell

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        _titleLabel.numberOfLines = 2;
    }
    
    return _titleLabel;
}

- (UITextView *)descriptionTextView
{
    if (!_descriptionTextView)
    {
        _descriptionTextView = [[UITextView alloc] init];
        _descriptionTextView.translatesAutoresizingMaskIntoConstraints = false;
        _descriptionTextView.textColor = [UIColor grayColor];
    }
    
    return _descriptionTextView;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor blueColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = true;
    }
    
    return _imageView;
}

- (UIImageView *)userImageView
{

    if (!_userImageView)
    {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.image = [UIImage imageNamed:@"vince"];
        _userImageView.layer.cornerRadius = 22.0;
        _userImageView.layer.masksToBounds = true;
    }
    
    return _userImageView;
}

- (UIView *)separator
{
    if (!_separator)
    {
        _separator = [[UIView alloc] init];
        _separator.backgroundColor = [UIColor lightGrayColor];
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
    [self addSubview:self.userImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.descriptionTextView];
    
    self.imageView.frame = CGRectMake(0, 0, 100, 100);
    self.backgroundColor = [UIColor whiteColor];
    
    [self addVisualConstraintWithFormat:@"H:|-16-[v0]-16-|" andView:@[self.imageView]];
    [self addVisualConstraintWithFormat:@"H:|-16-[v0(44)]" andView:@[self.userImageView]];

    [self addVisualConstraintWithFormat:@"V:|-16-[v0]-12-[v1(44)]-36-[v2]|" andView:@[self.imageView, self.userImageView, self.separator]];
    
    [self addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[self.separator]];
    [self addVisualConstraintWithFormat:@"V:[v0(1)]|" andView:@[self.separator]];

    // Title Label Constraints
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.imageView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:12]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.userImageView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:8]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.imageView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    
    self.titleHeightConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.titleLabel
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:0
                                                          constant:20];
    [self addConstraint:self.titleHeightConstraint];
    
    // Description TextView Constraints
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:3]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.userImageView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:8]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.imageView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.descriptionTextView
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0
                                                      constant:30]];


}

- (void)configureCell:(Video *)video
{

    self.imageView.image = [UIImage imageNamed:video.imageName];
    self.titleLabel.text = video.title;
    self.descriptionTextView.text = [NSString stringWithFormat:@"%@ - %@ - 23m ago", video.author, video.viewCount];
    
    NSString *title = self.titleLabel.text;
    CGSize size = CGSizeMake(self.frame.size.width - 16 - 44 - 8 - 16, 600);
    CGRect labelRect = [title
                        boundingRectWithSize:size
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:14]
                                     }
                        context:nil];
    
    if (labelRect.size.height > 20)
    {
        self.titleHeightConstraint.constant = 44;
    }
    else
    {
        self.titleHeightConstraint.constant = 20;
    }
}

@end
