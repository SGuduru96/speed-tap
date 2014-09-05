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
}

-(id)initWithType:(NSString *)type width:(GLfloat)w height:(GLfloat)h{
    int num;
    if([type isEqual:@"three"]){
        num = 3;
        
        //init _myColor as red
        _myColor = [[CCColor alloc]initWithRed:.9 green:.3 blue:.26 alpha:1];
    }else if([type isEqual:@"two"]){
        num = 2;
        
        //init _myColor as green
        _myColor = [[CCColor alloc]initWithRed:.22 green:.79 blue:.45 alpha:1];
    }else if([type isEqual:@"one"]){
        num = 1;
        
        //init _myColor as blue
        _myColor = [[CCColor alloc]initWithRed:.23 green:.6 blue:.85 alpha:1];
    }
    self = [self initWithColor:_myColor width:w height:h];
    
    if(self){
        _life = num;
        
    }
    return self;
}

-(void)onEnter{
    [super onEnter];
    self.userInteractionEnabled = YES;
    //_myLabel.string = [NSString stringWithFormat:@"%d", _life];
    _myLabel = [[CCLabelTTF alloc] initWithString:[NSString stringWithFormat:@"%d", _life] fontName:@"Helvetica" fontSize:60];
    [_myLabel setPosition:ccp([self boundingBox].size.width/2, [self boundingBox].size.height/2)];
    [self addChild:_myLabel];
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    _life = _life -= 1;
    if(_life == 0){
        [self removeFromParent];
    }
    
    //update label with new number
    _myLabel.string = [NSString stringWithFormat:@"%d", _life];
    
    //update color of tile depending on its "_life"
    if(_life == 2){
        _myColor = [[CCColor alloc]initWithRed:.22 green:.79 blue:.45 alpha:1];
    }else if(_life == 1){
        _myColor = [[CCColor alloc]initWithRed:.23 green:.6 blue:.85 alpha:1];
    }
}

@end
