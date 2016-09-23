//
//  MenuCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/23/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "MenuCollectionViewCell.h"
#import "UIView+Constraints.h"

@implementation MenuCollectionViewCell

-(NSArray *)imageNames
{
    if (!_imageNames)
    {
        self.imageNames = @[@"home_btn",@"trending_fire",@"subscriptions",@"profile_btn"];
    }
    return _imageNames;
}

-(UIImageView*)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"home_btn"];
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

-(void)setupView
{
    [self addSubview:self.imageView];
    
    [self addVisualConstraintWithFormat:@"H:[v0(25)]" andView:@[self.imageView]];
    [self addVisualConstraintWithFormat:@"V:[v0(25)]" andView:@[self.imageView]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
}

- (void)configureCell:(NSIndexPath*)indexPath
{
    NSString *imageName = self.imageNames[indexPath.row];
    UIImage *image = [UIImage imageNamed:imageName];
    self.imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];;
    
    [self.imageView setTintColor:[UIColor colorWithRed:139/255.0 green:0 blue:0 alpha:0.8]];
}

-(void)setSelected:(BOOL)selected
{
    if (selected)
    {
        self.imageView.tintColor = [UIColor whiteColor];
    }
    else
    {
        self.imageView.tintColor = [UIColor colorWithRed:139/255.0 green:0 blue:0 alpha:0.8];
    }
}


@end
