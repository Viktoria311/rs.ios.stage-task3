#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
if ([tree isEqualToArray: @[[NSNull null]] ] || [tree isEqualToArray: @[] ]) return @[];
if ([tree count] == 1) return [NSArray arrayWithObject: tree];
struct myTree {
int field;
struct myTree *left;
struct myTree *right;
};
//из массива в структуру
myTree exemplarOfStruct;
exemplarOfStruct.field = [[tree objectAtIndex: 0] intValue];
if ([tree objectAtIndex: 1] == [NSNull null]){

} else {

}
//из структуры в массив
    return nil;
}
