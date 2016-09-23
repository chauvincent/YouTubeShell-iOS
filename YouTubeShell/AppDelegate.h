//
//  AppDelegate.h
//  YouTubeShell
//
//  Created by Vincent Chau on 9/22/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HomeViewController *rootVC;
@property (strong, nonatomic) UINavigationController *nav;

@end

