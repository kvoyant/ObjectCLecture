//
//  main.m
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/05.
//  Copyright © 2020 김영호. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //헤더 파일 확인 단축키 : cmd + shift + o
        //NSString => length 찾기
        
        NSString *str = @"Hello iOS";
        NSInteger len = [str length];
        NSLog(@"length : %ld", len);
        
        NSLog(@"Upper case string : %@", [@"abc" uppercaseString ]);
        NSLog(@"capitalizedString : %@", [@"abc" capitalizedString]);
        
        
    }
    return 0;
}
