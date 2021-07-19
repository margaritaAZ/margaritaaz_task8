//
//  PaletteDelegate.h
//  task8
//
//  Created by Маргарита Жучик on 18.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaletteDelegate <NSObject>
- (void) saveColorsButtonTapped: (NSArray<UIColor *>*) colors;
@end

NS_ASSUME_NONNULL_END
