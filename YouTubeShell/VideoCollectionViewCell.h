//
//  VideoCollectionViewCell.h
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Constraints.h"
#import "Video.h"


@interface VideoCollectionViewCell : UICollectionViewCell

// Views
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *userImageView;
@property (strong, nonatomic) UIView *separator;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UITextView *descriptionTextView;

// Model
@property (strong, nonatomic) Video *video;

- (void)configureCell;

@end
