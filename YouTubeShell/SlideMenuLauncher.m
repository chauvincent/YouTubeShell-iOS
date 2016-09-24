//
//  MenuLauncher.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "SlideMenuLauncher.h"

@interface SlideMenuLauncher()

@property (strong, nonatomic) UIView *dimBackground;
@property (strong, nonatomic) UICollectionView *collectionView;

@end


@implementation SlideMenuLauncher

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
//        _collectionView.dataSource = self;
//        _collectionView.delegate = self;
    }
    return _collectionView;
}


- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)showMenu
{
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    self.dimBackground = [[UIView alloc] init];
    self.dimBackground.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [window addSubview:self.dimBackground];
    self.dimBackground.frame = window.frame;
    
    
    [window addSubview:self.collectionView];
    
    float menuHeight = 200.0f;
    float menuOrigin = window.frame.size.height - menuHeight;
    
    self.collectionView.frame = CGRectMake(0, menuOrigin, window.frame.size.width, menuHeight);
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissMenu:)];
    [self.dimBackground addGestureRecognizer:tapRecognizer];
    
    self.dimBackground.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.dimBackground.alpha = 1.0;
    }];
}
- (void)dismissMenu:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
            self.dimBackground.alpha = 0;
        } completion:^(BOOL finished) {
            [self.dimBackground removeFromSuperview];
        }];
}
     
@end
