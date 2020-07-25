//
//  Rectangles.h
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/09.
//  Copyright © 2020 김영호. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rectangles : NSObject

//프로퍼티 세팅만으로 값을 get set 할 수 있다.
@property (nonatomic) int width;
@property int height, height2;

//-(int)size;

@property (readonly)int size;

@end

NS_ASSUME_NONNULL_END
