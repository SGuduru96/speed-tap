//
//  TargetDock.m
//  explorer
//
//  Created by Shashank Guduru on 9/8/14.
//  Copyright 2014 Apportable. All rights reserved.
//

#import "TargetDock.h"


@implementation TargetDock{
    CGSize _nodeSize;
}

-(id)initWithColor:(CCColor *)color width:(GLfloat)w height:(GLfloat)h{
    self = [super initWithColor:color width:w height:h];
    
    if(self){
        _nodeSize = CGSizeMake(w, h);
    }
    return self;
}

-(void)onEnter{
    [super onEnter];
}

@end
