#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
if ([ratingArray count] < 3 || ratingArray == nil) {return 0;
} else if ([ratingArray count] == 3 && 
!(([[ratingArray objectAtIndex:0] intValue] > [[ratingArray objectAtIndex:1] intValue] && [[ratingArray objectAtIndex:1] intValue] > [[ratingArray objectAtIndex:2] intValue])||
([[ratingArray objectAtIndex:0] intValue] < [[ratingArray objectAtIndex:1] intValue] && [[ratingArray objectAtIndex:1] intValue] < [[ratingArray objectAtIndex:2] intValue])) )
    {return 0;}

NSInteger a = 0;
//проверка "первый меньше второго"
    for (int i=0; i < [ratingArray count]-2; i++ ) {//внешний цикл, берем первый элемент
        //берем элемент под индексом i
        //есть элемент больше элемента под индексом i? если есть, то есть элемент больше этого? если да, ++а
        for (int q = i+1; [[ratingArray oblectAtIndex: i] intValue] < [[ratingArray oblectAtIndex: q] intValue] && q < [ratingArray count]-1; q++ ){
           //есть ли элемент больше элемента под индексом q?
            for (int w = q+1; [[ratingArray oblectAtIndex: q] intValue] < [[ratingArray oblectAtIndex: w] intValue] && w < [ratingArray count]; w++ ){
            ++a;//считаем количество команд
            }
        }
    }
// проверка наоборот
    for (int j=0; j < [ratingArray count]-2; j++ ) {
     for (int e = j+1; [[ratingArray oblectAtIndex: j] intValue] > [[ratingArray oblectAtIndex: e] intValue] && e < [ratingArray count]-1; e++ ){
           //есть ли элемент меньше элемента под индексом e?
            for (int z = e+1; [[ratingArray oblectAtIndex: e] intValue] > [[ratingArray oblectAtIndex: z] intValue] && z < [ratingArray count]; z++ ){
            ++a;//считаем количество команд
            }
        }
    }

return a;
}

@end
