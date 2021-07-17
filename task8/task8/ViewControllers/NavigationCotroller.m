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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
