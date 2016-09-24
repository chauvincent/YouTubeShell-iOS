//
//  FeedCollectionViewCell.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "FeedCollectionViewCell.h"
#import "UIView+Constraints.h"
#import "VideoCollectionViewCell.h"
#import "Video.h"

@interface FeedCollectionViewCell() <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *videos;

@end

@implementation FeedCollectionViewCell

- (NSMutableArray *)videos
{
    if (!_videos)
    {
        _videos = [[NSMutableArray alloc] init];
    }
    
    return _videos;
}

- (UICollectionView *)collectionView
{
    
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"VideoCell"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;

    }
    return _collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self loadFakeData];
        [self setupView];
        [self.collectionView reloadData];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)setupView
{
    [self addSubview:self.collectionView];
    [self addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[self.collectionView]];
    [self addVisualConstraintWithFormat:@"V:|-50-[v0]|" andView:@[self.collectionView]];

}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.videos count];
}
 
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCell" forIndexPath:indexPath];
    [cell configureCell:self.videos[indexPath.row]];
 
    return cell;
}
 
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float inset = 32.0f;
    float aspectRatio = (9.0 / 16.0);
    float y = (self.frame.size.width - inset) * aspectRatio;
    float offset = 68.0f;
 
    return CGSizeMake(self.frame.size.width, y + offset + 16.0);
}
 
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
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
