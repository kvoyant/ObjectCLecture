//
//  Rectangles.m
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/09.
//  Copyright © 2020 김영호. All rights reserved.
//

#import "Rectangles.h"

@implementation Rectangles

-(int)size {
//    return self.width * self.height;
    return _width * _height;
}

-(void)setWidth:(int)width {
    if(width < 0)
        _width = 0;
    else
        _width = width;
}

//id 객체 반환
-(id)initWithWidth:(int)newWidth height:(int)newHeight {
    self = [super init];
    if(self) {
        _width = newWidth;
        _height = newHeight;
    }
    return self;
}

-(BOOL)isSquare {
    return _width == _height;
}

-(BOOL)isEqual:(id)object {
    //object가 Rectangles 타입인지 판단(정사각형만..) isMemberOfClass
    //isMemberOfClass => isKindOfClass 사각형도 포함
    if( [object isKindOfClass:[Rectangles class]]) {
        Rectangles *other = (Rectangles *)object;
        return _width == other.width && _height == other.height;
    }
    return NO;
}

-(BOOL)isEqualToRectangle:(Rectangles *)other {
    return _width == other.width && _height == other.height;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"Rectangles(%p) 가로 : %d 세로 : %d", self, _width, _height];//%p 객체주소
}
@end
