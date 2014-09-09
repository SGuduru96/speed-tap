//
//  TargetDock.h
//  explorer
//
//  Created by Shashank Guduru on 9/8/14.
//  Copyright 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TargetDock : CCNodeColor {
    
}

@property(nonatomic, strong)NSString *targetColor;
@property(nonatomic, strong)NSString *targetShape;

-(id)initWithColor:(CCColor *)color width:(GLfloat)w height:(GLfloat)h;

@end
