//
//  VideoCollectionViewCell.h
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *userImageView;
@property (strong, nonatomic) UIView *separator;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UITextView *descriptionTextView;


@end
