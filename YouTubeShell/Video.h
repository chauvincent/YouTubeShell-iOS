//
//  Video.h
//  YouTubeShell
//
//  Created by Vincent Chau on 9/23/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *viewCount;

-(instancetype)initWithTitle:(NSString *)title withImageName:(NSString *)name andAuthor:(NSString*)author andViewCount:(NSString*)count;

@end
