//
//  SKSMyScene.m
//  SpriteKitSpike
//
//  Created by dev1 on 1/7/14.
//  Copyright (c) 2014 Asynchrony. All rights reserved.
//

#import "SKSMyScene.h"

@interface SKSMyScene()

@property(nonatomic, strong) NSMutableArray *folderContents;

@end

@implementation SKSMyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor =  [SKColor whiteColor];
        CGSize folderSize = CGSizeMake(150, 100);
        CGSize padding = CGSizeMake(20, 20);
        CGPoint location = CGPointMake(padding.width + folderSize.width/2, padding.height + folderSize.height/2);
        SKShapeNode *folder = [self createFolderWithSize:CGRectMake(location.x, location.y, folderSize.width, folderSize.height)];
        [self addChild:folder];
        self.folderContents = [[NSMutableArray alloc] init];
        
        [self.folderContents addObject:[self createFolderWithSize:CGRectMake(0, 0, folderSize.width, folderSize.height)]];
        [self.folderContents addObject:[self createFolderWithSize:CGRectMake(0, 0, folderSize.width, folderSize.height)]];
        [self.folderContents addObject:[self createFolderWithSize:CGRectMake(0, 0, folderSize.width, folderSize.height)]];
        for (int i = 0; i < self.folderContents.count; i++) {
            SKShapeNode *subFolder = self.folderContents[i];
            subFolder.position = CGPointMake(folder.position.x + ((i + 1) * folderSize.width) + ((i + 1) * padding.width), folder.position.y);
            [self addChild:subFolder];
        }
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];        
        SKShapeNode *folder = [self createFolderWithSize:CGRectMake(location.x, location.y, 100, 100)];
        [self addChild:folder];
    }
}

-(SKShapeNode *) createFolderWithSize:(CGRect)rect {
    SKShapeNode *folder = [SKShapeNode node];
    UIBezierPath* topLeftBezierPath = [[UIBezierPath alloc] init];
    int tabHeight = 10;
    [topLeftBezierPath moveToPoint:CGPointMake(-rect.size.width/2, -rect.size.height/2)];
    [topLeftBezierPath addLineToPoint:CGPointMake(-rect.size.width/2, rect.size.height/2)];
    [topLeftBezierPath addLineToPoint:CGPointMake(-tabHeight/2, rect.size.height/2)];
    [topLeftBezierPath addLineToPoint:CGPointMake(0.0, rect.size.height/2 - tabHeight)];
    [topLeftBezierPath addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height/2 - tabHeight)];
    [topLeftBezierPath addLineToPoint:CGPointMake(rect.size.width/2, -rect.size.height/2)];
    [topLeftBezierPath closePath];
    folder.fillColor = [UIColor colorWithRed:230/225.0 green:221/225.0 blue:147/225.0 alpha:1];
    folder.path = topLeftBezierPath.CGPath;
    folder.lineWidth = 2.0;
    folder.strokeColor = [UIColor blackColor];
    folder.antialiased = NO;
    folder.position = CGPointMake(rect.origin.x, rect.origin.y);
        return folder;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
