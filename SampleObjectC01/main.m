//
//  main.m
//  SampleObjectC01
//
//  Created by 김영호 on 2020/07/05.
//  Copyright © 2020 김영호. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangles.h"//import!
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
        obj.width = -10;
        obj.height = 20;
        
        NSLog(@"Width : %d, Height : %d", obj.width, obj.height);
//        NSLog(@"Size : %d", [obj size]);
        NSLog(@"Size : %d", obj.size);
        //obj.size = 300;//compile error occur !! readonly property not writable !
        
        /*
         객체 비교 : 같은 객체인가? 주소가 같은가?
         */
        
             NSString *str1 = @"Hello World";
             NSString *str2 = [NSString stringWithFormat:@"Hello %@", @"World"];
             
            //다른 객체 이다 !
             if(str1 == str2)
                NSLog(@"같은 문자열 객체");
             else
                NSLog(@"다른 문자열 객체");//결과

            //같은 객체 이다  !
//             같은 객체를 참조하는 포인터와 비교
            NSString *str3 = str2;
            if(str2 == str3)
               NSLog(@"같은 문자열 객체");//결과
            else
               NSLog(@"다른 문자열 객체");

        /*
         객체 내용 비교 : isEqual:
            -(BOOL)isEqual:(id)object;
         */
//        문자열 내용 비교
            if([str1 isEqual:str2])
                NSLog(@"같은 문자열");//결과
            else
                NSLog(@"다른 문자열");
        /*
         클래스를 생성하고, 객체 비교해야 하면 isEqual: 메소드 작성
         사각형 객체간 비교 - 어떻게 비교할 것인가?
         
          -(BOOL)isEqual:(id)object {
             if([object isKindOfClass:[Rectangles class]]) {
                 Rectangles *other = (Rectangles *)object;
                 return _width == other.width && _height == other.height;
             }
             return NO;
         }
         
         isEqual: 의 id 타입 파라미터
            -(BOOL)isEqual:(id)object;
         
         타입 한정 메소드 작성
             NSString 의 경우
                -(BOOL)isEqualToString:(NSString *)aString;
         
         사각형 클래스의 isEqualToRectangle: 메소드
         
             -(BOOL)isEqual:(id)object {
                if([object isKindOfClass:[Rectangle class]]) {
                    return [self is EqualToRectangle:(Rectangle *)object];
                }
                return NO;
             }
             -(BOOL)isEqualToRectangle:(Rectangle *)other {
                return _width == other.width && _height == other.height;
             }
         
         */
        /*
         description
         
             객체의 상황을 설명하는 메소드
         
             NSLog의 %@에서 자동 동작
         
             기본 구현 : 클래스 이름과 주소
         
             Rectangle 클래스에 재작성
         
                 -(NSString *)description {
                    return [NSString stringWithFormat:@"Rectangle 클래스(%p), 가로:%d 세로:%d", self, _width, -height];
                 }
                //%p : 객체의 주소
         */

        Rectangles *r1 = [[Rectangles alloc] initWithWidth:20 height:20];
        Rectangles *r2 = [[Rectangles alloc] initWithWidth:10 height:20];
        
        if([r1 isEqual:r2])
            NSLog(@"R1과 R2는 같은 사각형");
        else
            NSLog(@"R1과 R2는 다른 사각형");
        
        Rectangles *r3 = [[Rectangles alloc] initWithWidth:10 height:20];
        if([r2 isEqual:r3])
            NSLog(@"R2과 R3는 같은 사각형");
        else
            NSLog(@"R2과 R3는 다른 사각형");
        
        Square *s1 = [[Square alloc] initWithWidth:20];
        if([r1 isEqual:s1])
            NSLog(@"R1과 S1는 같은 사각형");
        else
            NSLog(@"R1과 S1는 다른 사각형");
        
        if([r1 isEqualToRectangle:r2])
            NSLog(@"R1과 R2는 같은 사각형");
        else
            NSLog(@"R1과 R2는 다른 사각형");
        
//        NSString *str11 = @"ABCD";
//        if([r1 isEqualToRectangle:str11]) {
//
//        }
//        descript method
        NSLog(@"R1 : %@", r1);//R1 : Rectangles(0x103804900) 가로 : 20 세로 : 20
        

    }
    return 0;
}
