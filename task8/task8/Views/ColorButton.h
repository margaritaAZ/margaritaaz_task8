//
//  ColorButton.h
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorButton : UIButton
@property(nonatomic, strong) UIColor *color;
- (void) setButtonColor:(UIColor *)color;
- (void)setSelectedWithAnimation:(BOOL)selected;
@end

NS_ASSUME_NONNULL_END
