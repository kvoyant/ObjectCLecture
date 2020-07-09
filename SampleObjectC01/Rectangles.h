//
//  Rectangles.h
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/09.
//  Copyright © 2020 김영호. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rectangles : NSObject {
    int width;
    int height;
}

-(void)setWidth:(int)newWidth;
-(int)width;

-(void)setHeight:(int)newHeight;
-(int)height;

-(int)size;

@end

NS_ASSUME_NONNULL_END
