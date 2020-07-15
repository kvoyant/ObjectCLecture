//
//  Rectangles.m
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/09.
//  Copyright © 2020 김영호. All rights reserved.
//

#import "Rectangles.h"

@implementation Rectangles

-(id)init {
    self = [super init];
    if(self) {
        //초기화 코드
        [self setWidth:10];
        [self setHeight:20];
    }
    return self;
}


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
     
     메소드 선언과 구현
         사각형 클래스에 넓이 구하는 행위 작성 -> size 메소드
         메소드 선언
             @interface Rectangle: NSObject {
                int height, width;
             }
             -(int)size;
             @end
         
         메소드 구현
             @implementation Rectangle
             -(int)size {
                return width * height;
             }
             @end
     
     인스턴스 메소드와 클래스 메소드
                          인스턴스 메소드          클래스 메소드
             구별하기     : -기호로 시작             +기호로 시작
             메시지 리시버.:      객체                 클래스
             멤버변수접근  :      가능                 불가능
             선언예제     : -(void)method1;     +(void)method2;
             사용예제     : [obj method1]       [Class method2]
     
     인스턴스 메소드 선언
         @instance MyClass:NSObject
         -(void)instanceMethod;
         @end
     인스턴스 메소드 사용 => 객체 생성 필요
         Rectangle * rec = [[Rectangle alloc] init];
         int area = [rect size];
     멤버변수에 접근 가능
         -(int)size {
            return width * heigth
         }
     
     클래스 메소드 선언
         @interface MyClass:NSObject
         +(void)classMethod;
         @end
     클래스 메소드 사용 => 객체 생성 불필요
        [MyClass classMethod]
     클래스 메소드는 멤버 변수에 접근 불가. ERROR
         +(int)size {
            return width * height; => ERROR !
         }
     
     메소드 구현
         -(int)method2 {
            int ret;
             //
             return ret;
         }
         -(void)method3 {
             //code
             return;
         }
     메소드 선언(파라미터 있음)
         -(void)setWidth:(int)newWidth;
         -(void)setWidth:(int)newWidth height:(int)newHeight;
     메소드 구현(파라미터 있음)
         -(void)setWidth:(int)newWidth height:(int)newHeight {
         width = newWidth;
         height = newHeight;
     메소드 사용
     [rect setWidth:100];
     [rect setWidth:100 height:1000;
     
     클래스의 데이터 : 보호(캡슐화)
        클래스 외부에서 데이터 값을 얻거나/설정하기 위한 방법 사용
        setter 메소드 : 데이터 값을 설정하기 위한 의도
        getter 메소드 : 데이터 값을 얻어오기 위한 의도
     */
-(void)setWidth:(int)newWidth {
    width = newWidth;
}
-(int)width {
    return width;
}
-(void)setHeight:(int)newHeight {
    height = newHeight;
}
-(int)height {
    return height;
}
-(int)size {
    return width * height;
}
- (void)setWidth:(int)newWidth height:(int)newHeight {
    [self setWidth:newWidth];
    [self setHeight:newHeight];
}

-(BOOL)isSqure {
    
//    if(width == height)
//        return YES;
//    else
//        return NO;
    
    return width == height;
}
@end
