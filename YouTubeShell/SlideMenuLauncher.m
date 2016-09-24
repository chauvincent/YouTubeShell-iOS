//
//  MenuLauncher.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "SlideMenuLauncher.h"
#import "SlideMenuCollectionViewCell.h"


@interface Settings : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageNamed;

@end

@implementation Settings

- (instancetype)initWithName:(NSString *)name andImageName:(NSString*)imageName
{
    self = [super init];
    if (self) {
        _name = name;
        _imageNamed = imageName;
    }
    return self;
}

@end


@interface SlideMenuLauncher() <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UIView *dimBackground;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *settings;

@end

@implementation SlideMenuLauncher

- (NSArray *)settings
{
    if (!_settings)
    {
        Settings *settings  = [[Settings alloc] initWithName:@"Settings" andImageName:@"settings"];
        Settings *privacy   = [[Settings alloc] initWithName:@"Privacy Policy" andImageName:@"privacy"];
        Settings *feedback  = [[Settings alloc] initWithName:@"Settings" andImageName:@"feedback"];
        Settings *help      = [[Settings alloc] initWithName:@"Help" andImageName:@"help"];
        Settings *logout    = [[Settings alloc] initWithName:@"Logout" andImageName:@"logout"];
        Settings *cancel    = [[Settings alloc] initWithName:@"Cancel" andImageName:@"cancel"];
        _settings = @[settings, privacy, feedback, help, logout, cancel];
    }
    return _settings;
}


- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[SlideMenuCollectionViewCell class] forCellWithReuseIdentifier:@"Slide Menu Cell"];
    }
    return _collectionView;
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {

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
    
    float menuHeight = 300.0f;
    float menuOrigin = window.frame.size.height - menuHeight;
    
    self.collectionView.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, menuHeight);

    [UIView animateWithDuration:0.3 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
    
        self.collectionView.frame = CGRectMake(0, menuOrigin, window.frame.size.width, menuHeight);
    
    } completion:nil];
    
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
            UIWindow* window = [[UIApplication sharedApplication] keyWindow];
            float menuHeight = 300.0f;
            self.dimBackground.alpha = 0;
            self.collectionView.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, menuHeight);
        } completion:^(BOOL finished) {
            [self.dimBackground removeFromSuperview];
            [self.collectionView removeFromSuperview];
        }];
}

#pragma mark <UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Slide Menu Cell" forIndexPath:indexPath];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectionView.frame.size.width, 50.0);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end
