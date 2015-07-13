//
//  LocalStorage.h
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface LocalStorage : NSObject

+ (LocalStorage *)localStorage;

- (NSString *)getHost;
- (void)saveHost:(NSString *)host;

- (NSArray *)getRecents;
- (void)addToRecents:(Contact *)recent;

@end
