//
//  CustomMenuBar.h
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Constraints.h"

@protocol CustomMenuBarDelegate <NSObject>

- (void)scrollToMenuItemIndex:(int)index;

@end


@interface CustomMenuBar : UIView <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *imageNames;
@property (strong, nonatomic) NSLayoutConstraint *underlineLeftAnchorConstraint;
@property (weak, nonatomic) id<CustomMenuBarDelegate> delegate;

@end
