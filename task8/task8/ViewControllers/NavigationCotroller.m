//
//  NavigationCotroller.m
//  task8
//
//  Created by Маргарита Жучик on 16.07.21.
//

#import "NavigationCotroller.h"

@interface NavigationCotroller ()

@end

@implementation NavigationCotroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0f]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0f]} forState:UIControlStateNormal];
    self.navigationBar.barTintColor = UIColor.whiteColor;
}

@end
