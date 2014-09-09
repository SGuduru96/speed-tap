//
//  CCNodeColor+Tile.m
//  explorer
//
//  Created by Shashank Guduru on 9/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Tile.h"

@implementation Tile{
    //the ammount of times the tile can be tapped before being destroyd
    int _life;
    CCLabelTTF *_myLabel;
    NSString *_shape;
    CCColor *_myColor;
    CGSize _tileSize;
}

-(id)initWithShape:(NSString *)shape color:(NSString *)color width:(GLfloat)w height:(GLfloat)h{
    _myColor = [[CCColor alloc]initWithRed:.9 green:.3 blue:.26 alpha:0];
    self = [super initWithColor:_myColor width:w height:h];
    if(self){
        _shape = shape;
        _tileSize = [self boundingBox].size;
    }
    return self;
}

-(void)onEnter{
    [super onEnter];
    self.userInteractionEnabled = YES;
    CCNode *square = (CCNode *)[CCBReader load:@"Star.ccbi"];
    [square setScaleX:.4];
    [square setScaleY:.4];
    [self addChild:square];
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    [self removeFromParent];
}

@end
