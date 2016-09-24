//
//  CustomMenuBar.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "CustomMenuBar.h"
#import "MenuCollectionViewCell.h"

@interface CustomMenuBar()

@end

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

- (UICollectionView *)collectionView
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


- (id)initWithFrame:(CGRect)aRect
{
    self = [super initWithFrame:aRect];
    
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self addSubview:self.collectionView];
        
        UIView *underlineBar = [[UIView alloc] init];
        underlineBar.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.9];
        underlineBar.translatesAutoresizingMaskIntoConstraints = false;
        [self addSubview:underlineBar];
        
        self.underlineLeftAnchorConstraint = [underlineBar.leftAnchor constraintEqualToAnchor:self.leftAnchor];
        self.underlineLeftAnchorConstraint.active = true;
        
        [underlineBar.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
        [underlineBar.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier: 0.25].active = true;
        [underlineBar.heightAnchor constraintEqualToConstant: 8.0f].active = true;
        
        
        [self.collectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:@"CellMenu"];
        [self addVisualConstraintWithFormat:@"H:|[v0]|" andView:@[self.collectionView]];
        [self addVisualConstraintWithFormat:@"V:|[v0]|" andView:@[self.collectionView]];

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

#pragma mark - <UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate scrollToMenuItemIndex:(int)indexPath.row];
//    float selectedX = (CGFloat)indexPath.row * self.frame.size.width / 4;
//    self.underlineLeftAnchorConstraint.constant = selectedX;
//    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        [self layoutIfNeeded];
//    } completion:nil];
    
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
