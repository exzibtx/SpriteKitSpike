//
//  SKSMyScene.m
//  SpriteKitSpike
//
//  Created by dev1 on 1/7/14.
//  Copyright (c) 2014 Asynchrony. All rights reserved.
//

#import "SKSMyScene.h"
#import "SKSFolderView.h"

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
        
        SKSFolderView *folder = [[SKSFolderView alloc] initWithRect:CGRectMake(location.x, location.y, folderSize.width, folderSize.height)];
        
        [self  addChild:folder];
        
//        SKShapeNode *folder = [self createFolderWithSize:CGRectMake(location.x, location.y, folderSize.width, folderSize.height)];
//        [self addChild:folder];
        self.folderContents = [[NSMutableArray alloc] init];
        
        [self.folderContents addObject:[[SKSFolderView alloc] initWithRect:CGRectMake(0, 0, folderSize.width, folderSize.height)]];
        [self.folderContents addObject:[[SKSFolderView alloc] initWithRect:CGRectMake(0, 0, folderSize.width, folderSize.height)]];
        [self.folderContents addObject:[[SKSFolderView alloc] initWithRect:CGRectMake(0, 0, folderSize.width, folderSize.height)]];
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
        SKShapeNode *folder = [[SKSFolderView alloc] initWithRect:CGRectMake(location.x, location.y, 100, 100)];
        [self addChild:folder];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
