//
//  Rectangles.m
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/09.
//  Copyright © 2020 김영호. All rights reserved.
//

#import "Rectangles.h"

@implementation Rectangles

    /*
     file > new > file > mac OS > Cocoa Class
     
     클래스 이름으로 파일 생성
     선언부 : 헤더 파일(.h)
     구현부 : 구현 파일(.m)
     일반적으로 헤더 파일은 공개
     
     클래스 선언 - 클래스의 행위를 알리는 역할
         형식
            @interface 클래스 이름 : 부모 클래스
            @end
         Retangle.h
            @interface Rectangle:NSObject
            @end
     
     클래스의 구현 - 클래스의 행위 동작 코드 작성
         형식
            @implementation 클래스 이름
            @end
         Rectangle.m
            #import "Rectangle.h"
            @implementation Rectangle
            @end
     
     멤버 변수
        클래스 선언부에 작성하기
            @interface Rectangle:NSObject {
                int width;
             }
             @end
     
        클래스 구현부에 작성하기
             @implementation Rectangle {
                int width;
             }
             @end
     
     
     */

@end
