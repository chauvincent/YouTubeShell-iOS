//
//  HomeViewController.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "HomeViewController.h"
#import "VideoCollectionViewCell.h"
#import "FeedCollectionViewCell.h"
#import "TrendingCollectionViewCell.h"
#import "SubscriptionCollectionViewCell.h"
#import "ProfileCollectionViewCell.h"
#import "SlideMenuLauncher.h"
#import "CustomMenuBar.h"
#import "Video.h"

@interface HomeViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, SlideMenuLauncherDelegate, CustomMenuBarDelegate>

@property (strong, nonatomic) CustomMenuBar *menu;

@property (strong, nonatomic) SlideMenuLauncher *launcher;

@end

@implementation HomeViewController

- (CustomMenuBar *)menu
{
    if (!_menu)
    {
        _menu = [[CustomMenuBar alloc] initWithFrame:self.view.bounds];
        _menu.delegate = self;
    }
    return _menu;
}

- (SlideMenuLauncher *)launcher
{
    if (!_launcher)
    {
        _launcher = [[SlideMenuLauncher alloc] init];
        _launcher.delegate = self;
    }
    return _launcher;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View Setup

- (void)setupView
{
    [self setupMenu];
    [self setupNavigationBar];

    [self setupCollectionView];
    
}

- (void)setupNavigationBar
{
    
    // Navigation Bar View
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 30, self.view.frame.size.height)];
    label.text = @"Home";
    label.textColor = [UIColor whiteColor];
    
    UIView *statusBarView = [[UIView alloc] init];
    statusBarView.backgroundColor = [UIColor colorWithRed:139/255.0 green:0 blue:0 alpha:0.3];
    
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:statusBarView];
    
    [window addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[statusBarView]];
    [window addVisualConstraintWithFormat:@"V:|[v0(20)]" andView:@[statusBarView]];

    // Navigation Bar Buttons
    UIImage *searchIcon = [[UIImage imageNamed:@"searchbtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithImage:searchIcon style:UIBarButtonItemStylePlain target:self action:@selector(searchBarButtonPressed:)];
    UIImage *threeDotsIcon = [[UIImage imageNamed:@"threedots_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *dotsBarButtonItem = [[UIBarButtonItem alloc] initWithImage:threeDotsIcon style:UIBarButtonItemStylePlain target:self action:@selector(dotsBarButtonPressed:)];
    self.navigationItem.rightBarButtonItems = @[dotsBarButtonItem, searchBarItem];
    self.navigationItem.titleView = label;
    //self.navigationController.hidesBarsOnSwipe = true;
    
}

- (void)setupCollectionView
{
    
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0);
    self.collectionView.pagingEnabled = true;
    // Register Cell
    [self.collectionView registerClass:[FeedCollectionViewCell class] forCellWithReuseIdentifier:@"FeedCell"];
    [self.collectionView registerClass:[TrendingCollectionViewCell class] forCellWithReuseIdentifier:@"TrendingCell"];
    [self.collectionView registerClass:[SubscriptionCollectionViewCell class] forCellWithReuseIdentifier:@"SubCell"];
    [self.collectionView registerClass:[ProfileCollectionViewCell class] forCellWithReuseIdentifier:@"ProfileCell"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)setupMenu
{
    UIView *redOverlay = [[UIView alloc] init];
    redOverlay.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redOverlay];
    [self.view addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[redOverlay]];
    [self.view addVisualConstraintWithFormat:@"V:|[v0(50)]|" andView:@[redOverlay]];
    
    [self.view addSubview:self.menu];
    [self.view addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[self.menu]];
    [self.view addVisualConstraintWithFormat:@"V:[v0(50)]" andView:@[self.menu]];
 
    id topGuide = self.topLayoutGuide;
    [self.menu.topAnchor constraintEqualToAnchor:[topGuide bottomAnchor]].active = true;

    
    NSIndexPath *selection = [NSIndexPath indexPathForItem:0 inSection:0];
    
    [self.menu.collectionView selectItemAtIndexPath:selection animated:false scrollPosition:UICollectionViewScrollPositionNone];
    [self.menu.collectionView reloadData];
}

#pragma mark - Handle Navigation Press

- (void)searchBarButtonPressed:(id)sender
{
    
}

- (void)dotsBarButtonPressed:(id)sender
{
    [self.launcher showMenu];
}

- (void)scrollToMenuItemIndex:(int)index
{
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionNone animated:true];
    int currentIndex = (int)index;
    [self changeTitle:currentIndex];
}


#pragma mark - SettingsLauncherViewDelegate

- (void)finishedPickingOption:(NSInteger)selectedIndex
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:true];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FeedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FeedCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0)
    {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"FeedCell" forIndexPath:indexPath];
    }

    if (indexPath.row == 1)
    {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"TrendingCell" forIndexPath:indexPath];
        
    }
    
    if (indexPath.row == 2)
    {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"SubCell" forIndexPath:indexPath];
    }
    
    if (indexPath.row == 3)
    {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileCell" forIndexPath:indexPath];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 50);
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.menu.underlineLeftAnchorConstraint.constant = scrollView.contentOffset.x / 4.0f;

}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    float width = self.view.frame.size.width;
    float index = targetContentOffset->x / width;
    
    int currentIndex = (int)index;
    [self changeTitle:currentIndex];
    
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    [self.menu.collectionView selectItemAtIndexPath:path animated:YES scrollPosition:UICollectionViewScrollPositionNone];
}

#pragma mark - Helpers

- (void)changeTitle:(int)currentIndex
{
    NSArray *titles = @[@"Home", @"Trending", @"Subscriptions", @"Profile"];
    ((UILabel *)self.navigationItem.titleView).text = titles[currentIndex];
}

@end
