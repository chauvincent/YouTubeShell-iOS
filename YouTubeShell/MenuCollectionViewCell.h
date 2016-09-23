//
//  MenuCollectionViewCell.h
//  YouTubeShell
//
//  Created by Vincent Chau on 9/23/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) NSArray *imageNames;


- (void)configureCell:(NSIndexPath *)indexPath;

@end
