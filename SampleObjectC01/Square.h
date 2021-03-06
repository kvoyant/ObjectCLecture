//
//  Square.h
//  SampleObjectC01
//
//  Created by APPLE on 2020/07/09.
//  Copyright © 2020 김영호. All rights reserved.
//

#import "Rectangles.h"

NS_ASSUME_NONNULL_BEGIN

@interface Square : Rectangles

-(id)initWithWidth:(int)newWidth;

+(id)SquareWithWidth:(int)newWidth;

@end

NS_ASSUME_NONNULL_END
