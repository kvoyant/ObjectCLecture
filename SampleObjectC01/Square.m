//
//  Square.m
//  SampleObjectC01
//
//  Created by APPLE on 2020/07/09.
//  Copyright © 2020 김영호. All rights reserved.
//

#import "Square.h"

@implementation Square

-(void)setWidth:(int)newWidth {
    [super setWidth:newWidth];
    [super setHeight:newWidth];
}

+(id)SquareWithWidth:(int)newWidth {
    Square *newObj = [[Square alloc] initWithWidth:newWidth];
    return newObj;
}

-(id)initWithWidth:(int)newWidth {
    self = [super init];
    if(self) {
        [super setWidth:newWidth];
        [super setHeight:newWidth];
    }
    return self;
}
@end
