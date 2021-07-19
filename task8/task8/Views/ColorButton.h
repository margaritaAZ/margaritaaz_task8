//
//  ColorButton.h
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorButton : UIButton
//typedef NS_ENUM(NSInteger, ButtonState) {
//    selected,
//    disselected
//};
@property(nonatomic, strong) UIColor *color;
//@property (nonatomic, assign) ButtonState bState;

- (void) setButtonColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
