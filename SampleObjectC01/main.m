//
//  main.m
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/05.
//  Copyright © 2020 김영호. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangles.h"//import!

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
         
         < 프러퍼티 선언과 사용 >
         
             프로퍼티 : 점(.)을 이용해서 데이터에 접근
             클래스 선언부에 프로퍼티 선언
                @property([프로퍼티 속성])[타입][이름];

             프러퍼티 사용하기
                 Rectangle *obj = [[Rectangle alloc] init];
                 //프로퍼티로 값 설정하기
                 obj.width = 10;
                 obj.height = 20;
                 //프로퍼티로 값 얻어오기
                 int w = obj.width;
         
             클래스 내부 : self로 프로퍼티 사용
                 @implementation Rectangle
                 -(int)size {
                    return self.width * height;
                 }
                 @end
         
            프로퍼티와 게터/세터 메소드 비교
                 Rectangle *r = [[Rectangle alloc] init];
                 r.width = 10;//r 프로퍼티
                 r.height = 20;
                 
                 Rectangle *r = [Rectangle alloc] init];
                 [r setHeight:20];//세터 메소드
                 [r setWidth:10];
         
         
         < 프로퍼티와 멤버 변수 >
         
             프로퍼티 선언 -> 언더바(_) + 프로퍼티 이름의 멤버 변수
                 @implementation Rectangle
                 -(int)size {
                    return _width * _height;
                 }
                 @end
         
             멤버 변수 설정하기
                 synthesize : 멤버 변수 이름 설정
         
                 클래스 구현부에 @synthesize 작성
                    @synthesize [프로퍼티 이름];
                    @synthesize [프로퍼티 이름] = [멤버 변수 이름];
         
             멤버 변수의 이름을 프로퍼티의 이름과 같게 설정
                 @implementation Rectangle
                 @synthesize width;
                 -(int)size {
                    return width * _height;
                 }
                 @end
         
             멤버 변수의 이름을 별도로 설정
                 @implementation Rectangle
         
                 @synthesize width;
                 @synthesize height = rectangleHeight;
                 
                 -(int)size {
                    return width * rectangleHeight;
                 }
         
                @end
         
             주의 : 멤버변수와 프로퍼티가 중복된 현상 (에러 발생)
                 @interface Rectangle:NSObject {
                    int width;
                 }
                 @property int width;
                 @property int height;
                 @end
             
                 @implementation Rectangle
                 -(int)size {
                    return width * _height; // width 애매모호..error occur !!
                 }
                 @end
            => 해결 : 멤버 변수 선언과 프로퍼티 선언을 함께 하려면 synthesize로 프로퍼티와 멤버 변수 일치
                @synthesize width; // implementation에 추가 !!
         
         < 프로퍼티 속성 >
         
            프로퍼티 속성
                @property([속성 수식자]) [프로퍼티 타입][프로퍼티 이름];
             
            속성 종류
                읽기/쓰기 제어, 쓰레드 접근 제어, 게터와 세터 메소드 이름, 메모리 소유권
             readonly : 읽기 전용
             readwrite : 읽기 / 쓰기 가능 (기본, 생략 가능)
                 @property(readwrite) int width;
                 @property(readonly) int size;
            readonly 프로퍼티에 값을 설정할 때 에러 발생!
         
             atomic : 동시에 접근하는 쓰레드 제어(기본값, 생략 가능)
             
             nonatomic : 쓰레드 접근 제어 사용 안함
                @property(nonatomic) int width;
         
         
         < 프로퍼티와 게터/세터 메소드 >
         
             프로퍼티 선언 -> 게터와 세터 메소드 생성
             프로퍼티로 값 얻어오기 -> 게터 메소드 동작
             프로퍼티로 값 설정 -> 세터 메소드 동작
                 Rectangle *r = [[Rectangle alloc] init];
                 [r setWidth:20];
                 r.height = 30;
         
             프로퍼티 속성에 게터/세터 메소드 이름 설정
                 getter=[게터 메소드 셀렉터]
                 setter=[세터 메소드 셀렉터]
             width 게터와 세터 메소드 이름 설정하기
             보통 세터는 안함
                @property(getter=getWidth, setter=setRectangleWidth:)int width;
         
             프로퍼티를 이용한 값 설정과 얻어오기 : 기본 행위
             별도의 동작 -> 게터와 세터 메소드를 별도로 작성
             예) 사각형의 가로 길이는 0보다 작으면 안된다.
                 -(void)setWidth:(int)newWidth {
                    if(newWidth < 0)
                        _width = 0;
                    else
                        _width = newWidth;
                 }
         
            프로퍼티의 사용 -> 세터 메소드 동작(내부적으로 동작)
                 Rectangle *r1 = [[Rectangle alloc] init];
                 r1.width = -100; //세터 메소드 동작(내부적으로 동작)
         
             self 사용 주의. 무한 루프
                 -(void)setWidth:(int)newWidth {
                    self.width = newWidth;
                 }
             _멤버 변수 사용할 것
         
         */

        Rectangles *obj = [[Rectangles alloc] init];
        obj.width = 10;
        obj.height = 20;
        
        NSLog(@"Width : %d, Height : %d", obj.width, obj.height);
        
    }
    return 0;
}
