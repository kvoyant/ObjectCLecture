//
//  main.m
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/05.
//  Copyright © 2020 김영호. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangles.h"
#import "Square.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         <셀렉터>

         클래스에 선언된 메소드 구별하기
         메소드 식별하려면? : 이름, 파라미터 개수, 레이블
         메소드 선언
            -(NSUInteger)length
         셀렉터 => length
         
         ex) compare: , compare:options: , compare:options:range:
         
         <컴파일드 셀렉터>
         
         코드로 셀렉터 사용
         형태 : @selector(xxx)
         SEL 타입 : SEL s=@selector(length)
         */
        
        NSString *str = @"hello world";
        SEL s = @selector(uppercaseString);
        NSString *ret = [str performSelector:s];
        NSLog(@"Result : %@",ret);
        
        SEL s2 = @selector(abcd);
        
        if([str respondsToSelector:s2])
            [str performSelector:s2];//unrecognized selector error occur !!
        else
            NSLog(@"abcd 셀렉터 호출 불가!");
        
        /*
         < 프러퍼티 >
         
         프로퍼티 : 점(.)을 이용해서 데이터에 접근
         클래스 선언부에 프로퍼티 선언
            @property([프로퍼티 속성])[타입][이름];
         
         
         
         
         */

        
    }
    return 0;
}
