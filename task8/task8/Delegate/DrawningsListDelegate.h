//
//  DrawningsListDelegate.h
//  task8
//
//  Created by Маргарита Жучик on 19.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DrawningsListDelegate <NSObject>
- (void) selectedDrawning: (NSInteger) template;
@end

NS_ASSUME_NONNULL_END
