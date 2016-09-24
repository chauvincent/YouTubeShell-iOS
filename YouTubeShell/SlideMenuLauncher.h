//
//  MenuLauncher.h
//  YouTubeShell
//
//  Created by Vincent Chau on 9/24/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideMenuLauncherDelegate <NSObject>

- (void)finishedPickingOption:(NSInteger)selectedIndex;

@end

@interface SlideMenuLauncher : NSObject

@property (weak, nonatomic) id<SlideMenuLauncherDelegate> delegate;

- (void)showMenu;

@end
