#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
if ([string1 isEqualToString: @""]&& [string2 isEqualToString: @""]) return nil;
if ([string1 isEqualToString: @""]&& ![string2 isEqualToString: @""]) return string2;
if ([string2 isEqualToString: @""]&& ![string1 isEqualToString: @""]) return string1;
NSMutableString *s1 = [[NSMutableString alloc] initWithString: string1];
NSMutableString *s2 = [[NSMutableString alloc] initWithString: string2];
NSMutableString *r = [NSMutableString string];

for (; ![s1 isEqualToString: @""] && ![s2 isEqualToString: @""]; ) {//пока обе строки не пусты
//сравниваем букву

	if ([s1 characterAtIndex: 0] > [s2 characterAtIndex: 0]){

		[r appendString: [s1 subStringToIndex: 0] ];
		[s1  setString: [s1 substringFromIndex:1]];//возвращает строку от символа до конца. то есть урезает первые  этим заменяется s1

	} else if ([s1 characterAtIndex: 0]<[s2 characterAtIndex: 0]){

		[r appendString: [s2 subStringToIndex: 0] ];
		[s2  setString: [s2 substringFromIndex:1]];

	} else if ([s1 characterAtIndex: 0]==[s2 characterAtIndex: 0]) {//если первые буквы обинаковы

			if ([s1 characterAtIndex: 1] > [s2 characterAtIndex: 1]) { 
				[r appendString: [s1 subStringToIndex: 0] ];
				[s1  setString: [s1 substringFromIndex:1]];

			} else if([s1 characterAtIndex: 1] < [s2 characterAtIndex: 1]){
				[r appendString: [s2 subStringToIndex: 0] ];
				[s2  setString: [s2 substringFromIndex:1]];
			}
	}

}//закончили цикл for
//значит дальше одна из строк пустая, и надо оставшуюся непустую строку добавить к конец строки r
if ([s1 isEqualToString: @""]) {[r appendString: s2];} else if ([s2 isEqualToString: @""]) {[r appendString: s1];}
    return [[NSString alloc] initWithString: r];
}

@end
