#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
switch (monthNumber) {
case 1: return @"January";
case 2: return @"February";
case 3: return @"March";
case 4: return @"April";
case 5: return @"May";
case 6: return @"June";
case 7: return @"July";
case 8: return @"August";
case 9: return @"September";
case 10: return @"October";
case 11: return @"November";
case 12: return @"December";
}
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
NSDateFormatter *my = [[[NSDateFormatter alloc] init] setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
if ([my dateFromString: date] == nil) return (long)(0);

NSDate *realDate = [my dateFromString: date]; 
//метод экземпляра dateFromString и инициализируем переданной строкой

NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate: realDate];
if ([components month]>12) return (long)(0);

return (long)[components day];

}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {

/* берём Грегорианский календарь*/
NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
/* NSDateComponents позволяет вытащить из NSDate номер дня недели, день месяца и пр. */
NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate: date];


//здесь должна быть проверка на реальность даты. если дата неверна return nil;

if ([comps year] % 4 == 0 && [comps year] % 100 == 0 && [comps year] % 400 == 0 && [comps month]==2 && [comps day]!=29) {return nil;}
else if ([comps year] % 4 == 0 && [comps year] % 100 != 0 && [comps month]==2 && [comps day]!=28) {return nil;}
else if (([comps month]==1 ||[comps month]==3 ||[comps month]==5 || [comps month]==7 || [comps month]==8 || [comps month]==10 || [comps month]==12)  && [comps day]!=31) {return nil;}
else if (([comps month]==4 || [comps month]==6 || [comps month]==9 || [comps month]==11) && [comps day]!=30) {return nil;}

// получаем номер дня. Он будет от 1 до 7
NSInteger weekday = [comps weekday];
switch (weekday) {
case 1: return @"Пн";
case 2: return @"Вт";
case 3: return @"Ср";
case 4: return @"Чт";
case 5: return @"Пт";
case 6: return @"Сб";
case 7: return @"Вс"; }
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
if ([[[NSCalendar currentCalendar] components: NSCalendarUnitWeekOfYear fromDate:[NSDate date]] weekOfYear] ==
[[[NSCalendar currentCalendar] components: NSCalendarUnitWeekOfYear fromDate:date] weekOfYear]) {return YES;}

    return NO;
}

@end
