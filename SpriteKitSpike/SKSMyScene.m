//
//  SKSMyScene.m
//  SpriteKitSpike
//
//  Created by dev1 on 1/7/14.
//  Copyright (c) 2014 Asynchrony. All rights reserved.
//

#import "SKSMyScene.h"
#import "SKSFolder.h"

@interface SKSMyScene()
@property (nonatomic, strong) SKSFolder *rootFolder;
@end

@implementation SKSMyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor =  [SKColor whiteColor];
        CGSize folderSize = CGSizeMake(150, 100);
        CGSize padding = CGSizeMake(20, 20);
        CGPoint location = CGPointMake(padding.width + folderSize.width/2, padding.height + folderSize.height/2);
        
        SKSFolder *folder = [[SKSFolder alloc] initWithName:@"Root Folder" andRect:CGRectMake(location.x, location.y, folderSize.width, folderSize.height)];
        [self  addChild:folder];
        
        SKSFolder *subFolder1 = [[SKSFolder alloc] initWithName:@"Folder 1" andRect:CGRectMake(0, 0, folderSize.width, folderSize.height)];
        SKSFolder *subFolder2 = [[SKSFolder alloc] initWithName:@"Folder 2" andRect:CGRectMake(0, 0, folderSize.width, folderSize.height)];
        SKSFolder *subFolder3 = [[SKSFolder alloc] initWithName:@"Folder 3" andRect:CGRectMake(0, 0, folderSize.width, folderSize.height)];
        
        [folder.subFolders addObject:subFolder1];
        [folder.subFolders addObject:subFolder2];
        [folder.subFolders addObject:subFolder3];
        for (int i = 0; i < folder.subFolders.count; i++) {
            SKShapeNode *subFolder = folder.subFolders[i];
            subFolder.position = CGPointMake(folder.position.x + ((i + 1) * folderSize.width) + ((i + 1) * padding.width), folder.position.y);
            [self addChild:subFolder];
        }
        
        self.rootFolder = folder;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];        
//        SKShapeNode *folder = [[SKSFolder alloc] initWithRect:CGRectMake(location.x, location.y, 100, 100)];
//        [self addChild:folder];
//    }
    
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    [self selectNodeForTouch:positionInScene];

}

- (void)selectNodeForTouch:(CGPoint)touchLocation {
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
    if (touchedNode != nil) {
        if(![_rootFolder isEqual:touchedNode]) {
            NSLog(@"You just touched: %@", touchedNode.name);
        } else {
            NSLog(@"I am the root folder: %@", touchedNode.name);
        }
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
