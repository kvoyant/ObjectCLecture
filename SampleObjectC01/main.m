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
    }
    return 0;
}
