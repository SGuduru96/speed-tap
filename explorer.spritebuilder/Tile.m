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
}

-(id)initWithColor:(CCColor*)color width:(GLfloat)w height:(GLfloat)h number:(int)num{
    self = [self initWithColor:color width:w height:h];
    
    if(self){
        _life = num;
    }
    
    return self;
}

-(void)onEnter{
    [super onEnter];
    self.userInteractionEnabled = YES;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    _life = _life -= 1;
    if(_life == 0){
        [self removeFromParent];
    }
}

@end
