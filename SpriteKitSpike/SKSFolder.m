//
//  SKSFolder.m
//  SpriteKitSpike
//
//  Created by dev1 on 1/7/14.
//  Copyright (c) 2014 Asynchrony. All rights reserved.
//

#import "SKSFolder.h"


@implementation SKSFolder

-(id)initWithName:(NSString *)name andRect:(CGRect)rect {
     if (self = [super init]) {
         self.name = name;
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
         
         SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
         
         myLabel.text = name;
         myLabel.fontSize = 20;
         myLabel.fontColor = [SKColor blackColor];
         
         [self addChild:myLabel];

     }
    return self;
    
}

@end
