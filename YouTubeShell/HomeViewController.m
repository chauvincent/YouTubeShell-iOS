//
//  HomeViewController.m
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>


@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Home";
    self.collectionView.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
