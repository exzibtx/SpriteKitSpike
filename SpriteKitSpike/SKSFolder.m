//
//  SKSFolder.m
//  SpriteKitSpike
//
//  Created by dev1 on 1/7/14.
//  Copyright (c) 2014 Asynchrony. All rights reserved.
//

#import "SKSFolder.h"


@implementation SKSFolder

-(id)initWithRect:(CGRect)rect {
     if (self = [super init]) {
         UIBezierPath* topLeftBezierPath = [[UIBezierPath alloc] init];
         int tabHeight = 10;
         [topLeftBezierPath moveToPoint:CGPointMake(-rect.size.width/2, -rect.size.height/2)];
         [topLeftBezierPath addLineToPoint:CGPointMake(-rect.size.width/2, rect.size.height/2)];
         [topLeftBezierPath addLineToPoint:CGPointMake(-tabHeight/2, rect.size.height/2)];
         [topLeftBezierPath addLineToPoint:CGPointMake(0.0, rect.size.height/2 - tabHeight)];
         [topLeftBezierPath addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - tabHeight)];
         [topLeftBezierPath addLineToPoint:CGPointMake(rect.size.width/2, -rect.size.height/2)];
         [topLeftBezierPath closePath];
         self.fillColor = [UIColor colorWithRed:230/225.0 green:221/225.0 blue:147/225.0 alpha:1];
         self.path = topLeftBezierPath.CGPath;
         self.lineWidth = 2.0;
         self.strokeColor = [UIColor blackColor];
         self.antialiased = NO;
         self.position = CGPointMake(rect.origin.x, rect.origin.y);
         
         self.subFolders = [[NSMutableArray alloc] init];
     }
    return self;
    
}

@end
