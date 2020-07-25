//
//  Square.m
//  SampleObjectC01
//
//  Created by APPLE on 2020/07/09.
//  Copyright © 2020 김영호. All rights reserved.
//

#import "Square.h"

@implementation Square

-(id)initWithWidth:(int)newWidth {
    return [super initWithWidth:newWidth height:newWidth];
    
//    self = [super init];
//    if( self ) {
//        [super setWidth:newWidth];
//        [super setHeight:newWidth];
//    }
//    return self;
}

-(void)setWidth:(int)newWidth {
    [super setWidth:newWidth];
    [super setHeight:newWidth];
}

+(id)SquareWithWidth:(int)newWidth {
    Square *newObj = [[Square alloc] initWithWidth:newWidth];
    return newObj;
}
@end
