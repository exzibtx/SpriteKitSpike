//
//  SKSFolder.h
//  SpriteKitSpike
//
//  Created by dev1 on 1/7/14.
//  Copyright (c) 2014 Asynchrony. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKSFolder : SKShapeNode
@property (nonatomic, strong) NSString *folderName;
@property (nonatomic, strong) NSMutableArray *subFolders;

-(id)initWithName:(NSString *)name andRect:(CGRect)rect;

@end
