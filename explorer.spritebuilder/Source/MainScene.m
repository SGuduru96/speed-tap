//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//master

#import "MainScene.h"
#import "Tile.h"

@implementation MainScene{
    //stores the screen size of the device
    CGSize _screenSize;
    //this array hows the list of tiles
    NSMutableArray *_listOfTiles;
    
    
    //this is value is used to determine how many taps it should take to clear a row of tiles. This is the limit.
    int _rowTileTapLimit;
}

-(id)init{
    self = [super init];
    
    if(self){
        _rowTileTapLimit = 6;
        _listOfTiles = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)onEnter{
    [super onEnter];
    
    //get the screen size
    _screenSize = [self boundingBox].size;
    [self createRowOfTiles];
}

-(void)drawGridWithRow:(int)row AndCol:(int)col{
    CGPoint tilePos = {0, 0};
    for(int r = 0; r < row; r++){
        for(int c = 0; c < col; c++){
            Tile *tile = [[Tile alloc] initWithShape:@"Square" color:@"red" width:_screenSize.width/4 - 1 height:_screenSize.width/4 - 1];
            tile.position = tilePos;
            [self addChild:tile];
            tilePos.x = tilePos.x + _screenSize.width/4 + 1;
        }
        tilePos.x = 0;
        tilePos.y = tilePos.y + _screenSize.width/4 + 1;
    }
}

/*
 This method creates a row of tils, it does this by randomly generating a number between 1-4 which signifies
 the amount of tiles in that row. From there each tile is randomly chosen. 
 
 this methos is recursive and is called every 1.5 seconds after it is first initiated.
 */
-(void)createRowOfTiles{
    //randomly chooses between 1-4 tiles for the row
    int numOfTiles = (arc4random() % 4)+1;
    //used to store the number of taps to get rid of the whole row of tiles. The ideal number is 6 taps
    //stores the position of the tile
    CGPoint tilePos = {0, _screenSize.height + _screenSize.width/4 + 1};
    NSLog(@"important!!! %f", _screenSize.width/4);
    for(int i = 0; i < numOfTiles; i++){
        
        Tile *tile = [[Tile alloc]initWithShape:@"Square" color:@"red" width:_screenSize.width/4 - 1 height:_screenSize.width/4 - 1];
        
        tile.position = tilePos;
        
        [self addChild:tile];
        
        [_listOfTiles addObject:tile];
        
        tilePos.x += _screenSize.width/4 + 1;
    }
    
    //calls create row of tiles again after 1.5 seconds. The repeats is set to no because this is a "recursive method"
    [NSTimer scheduledTimerWithTimeInterval:1.5
                                     target:self
                                   selector:@selector(createRowOfTiles)
                                   userInfo:nil
                                    repeats:NO];
}


-(void)update:(CCTime)delta{
    //loop through the list of tiles and move each tile down by the desired amount
    for(int i = 0; i < [_listOfTiles count]; i++){
        
        Tile *tile = [_listOfTiles objectAtIndex:i];
        CGPoint pos = tile.position;
        pos.y -= 120 * delta;
        tile.position = pos;
        if(pos.y < -_screenSize.width/4 + 1){
            [tile removeFromParent];
            [_listOfTiles removeObjectAtIndex:i];
            NSLog(@"remove from parent");
            i--;
        }
    }
}

@end
