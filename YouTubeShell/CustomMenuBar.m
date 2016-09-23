//
//  CustomMenuBar.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "CustomMenuBar.h"
#import "MenuCollectionViewCell.h"

@implementation CustomMenuBar

BOOL first = false;

- (NSArray *)imageNames
{
    if (!_imageNames)
    {
        self.imageNames = @[@"home_btn",@"trending_fire",@"subscriptions",@"profile_btn"];
    }
    return _imageNames;
}

- (UICollectionView*)collectionView
{
    
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        first = true;
    }
    return _collectionView;
}


-  (id)initWithFrame:(CGRect)aRect
{
    self = [super initWithFrame:aRect];
    
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        [self addSubview:self.collectionView];
        [_collectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:@"CellMenu"];
        
        [self addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[self.collectionView]];
        [self addVisualConstraintWithFormat:@"V:|[v0]|" andView:@[self.collectionView]];

    }
    
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
       
    }
    
    return self;
}

#pragma mark - <UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellMenu" forIndexPath:indexPath];
    NSString *imageName = self.imageNames[indexPath.row];
    UIImage *image = [UIImage imageNamed:imageName];
    cell.imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [cell.imageView setTintColor:[UIColor colorWithRed:139/255.0 green:0 blue:0 alpha:0.8]];
    
    if (first)
    {
        cell.selected = true;
        [self.collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
        [cell.imageView setTintColor:[UIColor whiteColor]];
        first = false;
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(self.frame.size.width / 4.0f, self.frame.size.height);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


@end
