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
        
        /*
         메소드 : 클래스의 행위를 정의
         동작 수행 : 객체에 메소드를 호출
         메세지 : 객체에 메소드를 호출해서 동작 수행
         리시버(receiver) : 메세지를 받아서 동작을 수행하는 객체
         샌더(sender) : 메세지를 보내는 객체
         
         메소드 호출 표기 : [리시버 메세지]
         문자열 객체에 length 메소드 호출 [str(리시버) length(메세지)]
         메소드 연속 호출 [[NSString alloc] init]
         
         객체가 동작 결과를 센더에게 알려주기 - 데이터의 개수 , 길이
         length 메소드 : 정수형 반환값 - (NSUInteger)length
         반환값 저장하기 - NSUInteger length = [str length];
         void : 반환값이 없는 경우 - (void)appendString:(NSString *)aString;
         
         메소드 선언에서 데이터 타입 정의
            - 메소드 실행 과정에서 정보 전달받기
            - 메소드의 실행 결과를 반환
         
         반환값, 파라미터 => 객체이면 표기법 ( 클래스 이름과*)
            - (NSString *)uppercaseString;
         구조체 => * 없이 사용
            - (NSRange)rangeOfString:(NSString *)aString;
         */
        
        //단축키 : 헤더 파일 확인 cmd + shift + o
        //NSString => length 찾기
        
        NSString *str = @"Hello iOS";
        NSInteger len = [str length];
        NSLog(@"length : %ld", len);
        
        NSLog(@"Upper case string : %@", [@"abc" uppercaseString ]);
        NSLog(@"capitalizedString : %@", [@"abc" capitalizedString]);
        
        /*
         메소드 호출시 정보 전달
         파라미터 레이블과 콜론(:) 사용
         */
        //단축키 cmd + click => api 이동 or esc
        NSString *str1 = @"1";
        NSComparisonResult result = [str1 compare:@"09"];
        
        NSLog(@"Result : %ld", result);//1 ( 1 > 0 )
        /*
            -1 : ASCII 코드 기준으로 문자열(s2)이 클때
            0 : ASCII 코드 기준으로 두 문자열이 같을 때
            1 : ASCII 코드 기준으로 문자열(s1)이 클때
         */
        
        NSComparisonResult result2 = [str1 compare:@"09" options:NSNumericSearch];
        NSLog(@"Result2 : %ld", result2);//-1
        //숫자로 비교 1 < 09 : -1 ?? , 1 > 0 : 1
        
        
        /*
        클래스 메소드
            - (+) 기호 사용
            - 리시버가 클래스
            - alloc 메소드, 팩토리 메소드
     
        메소드 정의 예제
            - +(instancetype)string;
     
        인스턴스 메소드
            - (-) 기호사용
            - 리시버가 객체
            - 객체 생성 과정 필요, 객체에 설정된 정보 사용 가능
     
        메소드 정의 예제
            - (NSUInteger)length;
         
         
         객체를 생성하는 메소드
            alloc/init
         
         다양한 init 계열의 메소드(NSString 클래스)
            (id)init;
            (id)initWithString:(NSString
     
            
         */
        
        
        
    }
    return 0;
}
