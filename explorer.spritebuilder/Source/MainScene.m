//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Tile.h"

@implementation MainScene{
    //stores the screen size of the device
    CGSize _screenSize;
    NSMutableArray *_grid;
    //this is the base red color.
    CCColor *_red;
    CCColor *_green;
    CCColor *_blue;
}

-(id)init{
    self = [super init];
    
    if(self){

        
        //init the colors
        //init red with CCColor of red
        _red = [[CCColor alloc]initWithRed:1 green:0 blue:0 alpha:1];
        
        //init green with CCColor of green
        _green = [[CCColor alloc]initWithRed:0 green:1 blue:0 alpha:1];
        
        //init blue with CCColor of blue
        _blue = [[CCColor alloc]initWithRed:0 green:0 blue:1 alpha:1];
        
    }
    
    return self;
}

-(void)onEnter{
    [super onEnter];
    
    //get the screen size
    _screenSize = [self boundingBox].size;
    [self drawGridWithRow:4 AndCol:4];
}

-(void)drawGridWithRow:(int)row AndCol:(int)col{
    CGPoint tilePos = {0, 0};
    for(int r = 0; r < row; r++){
        for(int c = 0; c < col; c++){
            Tile *tile = [[Tile alloc]initWithColor:_red width:_screenSize.width/4 - 1 height:_screenSize.width/4 - 1 number:3];
            tile.position = tilePos;
            [self addChild:tile];
            tilePos.x = tilePos.x + _screenSize.width/4 + 1;
        }
        tilePos.x = 0;
        tilePos.y = tilePos.y + _screenSize.width/4 + 1;
    }
}

@end
