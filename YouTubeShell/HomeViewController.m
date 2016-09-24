//
//  HomeViewController.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "HomeViewController.h"
#import "VideoCollectionViewCell.h"
#import "SlideMenuLauncher.h"
#import "CustomMenuBar.h"
#import "Video.h"

@interface HomeViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, SlideMenuLauncherDelegate>

@property (strong, nonatomic) CustomMenuBar *menu;
@property (strong, nonatomic) NSMutableArray *videos;
@property (strong, nonatomic) SlideMenuLauncher *launcher;

@end

@implementation HomeViewController

- (CustomMenuBar *)menu
{
    if (!_menu)
    {
        _menu = [[CustomMenuBar alloc] initWithFrame:self.view.bounds];
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

- (NSMutableArray *)videos
{
    if (!_videos)
    {
        _videos = [[NSMutableArray alloc] init];
    }
    
    return _videos;
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
    [self setupNavigationBar];
    [self loadFakeData];
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0);
    
    // Register Cell
    [self.collectionView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
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
    self.navigationController.hidesBarsOnSwipe = true;
    
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

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.videos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell configureCell:self.videos[indexPath.row]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float inset = 32.0f;
    float aspectRatio = (9.0 / 16.0);
    float y = (self.view.frame.size.width - inset) * aspectRatio;
    float offset = 68.0f;
    
    return CGSizeMake(self.view.frame.size.width, y + offset + 16.0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
}

#pragma mark - SettingsLauncherViewDelegate

- (void)finishedPickingOption:(NSInteger)selectedIndex
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:true];
}


#pragma mark - Helpers

- (void)loadFakeData
{
    Video *vid1 = [[Video alloc] initWithTitle:@"The Nyan Cat Documentation" withImageName:@"nyan-cat" andAuthor:@"Nyan Cat Fans" andViewCount:@"3,000,000 views"];
    
    Video *vid2 = [[Video alloc] initWithTitle:@"Dragon Ball Z: Vegeta" withImageName:@"vegeta" andAuthor:@"Dragon Ball Z Fans" andViewCount:@"9,000 views"];
    
    Video *vid3 = [[Video alloc] initWithTitle:@"Nyan Cat Races With Other Catdfasdfsadfsdfasdfsdfsafsfsdafsa" withImageName:@"nyan-cat-race" andAuthor:@"Nyan Cat Fans" andViewCount:@"8,000,000 views"];
    self.videos = [@[vid1, vid2, vid3] mutableCopy];
    
}

@end
