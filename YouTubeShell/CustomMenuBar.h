//
//  CustomMenuBar.h
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Constraints.h"

@interface CustomMenuBar : UIView <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;

@end
