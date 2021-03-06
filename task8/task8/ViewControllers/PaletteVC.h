//
//  PaletteVC.h
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

#import <UIKit/UIKit.h>
#import "PaletteDelegate.h"
#import "ColorButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaletteVC : UIViewController

@property(weak, nonatomic) id<PaletteDelegate> delegate;

- (void) setPickedButtons: (NSArray<UIColor *>*) colors;

@end

NS_ASSUME_NONNULL_END
