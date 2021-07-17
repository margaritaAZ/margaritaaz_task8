//
//  ArtistViewController.m
//  task8
//
//  Created by Маргарита Жучик on 16.07.21.
//

#import "ArtistViewController.h"
#import "CanvasView.h"

@interface ArtistViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *drawingsButton;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

//    [self addCanvasView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupNavigationItems];
}

- (void)setupNavigationItems {
    self.navigationItem.title = @"Artist";
    self.drawingsButton.tintColor = [UIColor colorNamed:@"Light Green Sea"];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0f]} forState:UIControlStateNormal];
}

- (void) showDrawingsView: (id) sender {

}

//- (void) addCanvasView {
//    CanvasView *canvasView = [[CanvasView alloc] initWithFrame: CGRectMake(0, 0, 300, 300)];
//   // canvasView.layer.borderColor = [UIColor colorWithRed:0.13 green: 0.692 blue: 0.557 alpha: 1].CGColor;
//   canvasView.layer.borderColor = [UIColor.blackColor CGColor];
//    canvasView.layer.borderWidth = 1.0;
////    canvasView.backgroundColor = UIColor.blueColor;
//    [self.view addSubview:canvasView];
//    UIView *parent = self.view;
//    canvasView.translatesAutoresizingMaskIntoConstraints = NO;
//    [canvasView.leadingAnchor constraintEqualToAnchor:parent.leadingAnchor constant:38].active = YES;
//    [canvasView.topAnchor constraintEqualToAnchor:parent.topAnchor constant:102].active = YES;
//    [canvasView.widthAnchor constraintEqualToConstant:300].active = YES;
//    [canvasView.heightAnchor constraintEqualToConstant:300].active = YES;

//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
