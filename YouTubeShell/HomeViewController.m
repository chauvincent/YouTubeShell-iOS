//
//  HomeViewController.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "HomeViewController.h"
#import "VideoCollectionViewCell.h"
#import "CustomMenuBar.h"

@interface HomeViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) CustomMenuBar *menu;

@end

@implementation HomeViewController

- (CustomMenuBar*)menu
{
    if (!_menu)
    {
        _menu = [[CustomMenuBar alloc] initWithFrame:self.view.bounds];
    }
    return _menu;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
    [self setupMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View Setup
- (void)setupView
{
    // Navigation Set up
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 30, self.view.frame.size.height)];
    navLabel.text = @"Home";
    navLabel.textColor = [UIColor whiteColor];
    
    UIView *status = [[UIView alloc] init];
    status.backgroundColor = [UIColor colorWithRed:139/255.0 green:0 blue:0 alpha:0.3];
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:status];
    [window addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[status]];
    [window addVisualConstraintWithFormat:@"V:|[v0(20)]" andView:@[status]];
    
    self.navigationItem.titleView = navLabel;
    
    // Register Cell
    [self.collectionView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)setupMenu
{
    [self.view addSubview:self.menu];
    [self.view addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[self.menu]];
    [self.view addVisualConstraintWithFormat:@"V:|[v0(50)]" andView:@[self.menu]];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float inset = 32.0f;
    float aspectRatio = (9.0 / 16.0);
    float y = (self.view.frame.size.width - inset) * aspectRatio;
    float offset = 68.0f;
    
    return CGSizeMake(self.view.frame.size.width, y + offset);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
}

@end
