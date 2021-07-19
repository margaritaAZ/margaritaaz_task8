//
//  ArtistViewController.m
//  task8
//
//  Created by Маргарита Жучик on 16.07.21.
//

#import "ArtistViewController.h"
#import "CanvasView.h"
#import "AButton.h"
#import "PaletteVC.h"
#import "PaletteDelegate.h"
#import "CanvasViewDelegate.h"
#import "task8-Swift.h"
#import "TimerDelegate.h"


@interface ArtistViewController () <PaletteDelegate, CanvasViewDelegate, TimerDelegate>

@property (weak, nonatomic) IBOutlet AButton *shareButton;
@property (weak, nonatomic) IBOutlet AButton *openPaletteButton;
@property (weak,nonatomic) PaletteVC *paletteVC;
@property (weak,nonatomic) TimerViewController *timerVC;
@property (weak, nonatomic) IBOutlet AButton *drawButton;
@property (weak, nonatomic) IBOutlet CanvasView *canvasView;
@property (strong, nonatomic) NSArray<UIColor *>* lineColors;
@property (weak, nonatomic) IBOutlet AButton *resetButton;
@property (weak, nonatomic) IBOutlet AButton *openTimerButton;
@property (assign, nonatomic) float timer;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.shareButton setEnabled:NO];
    
    [self.paletteVC.view setHidden:YES];
    [self.openPaletteButton addTarget:self action:@selector(openPalette) forControlEvents:UIControlEventTouchUpInside];
    [self.openTimerButton addTarget:self action:@selector(openTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.drawButton addTarget:self action:@selector(startDrawing) forControlEvents:UIControlEventTouchUpInside];
    [self.resetButton addTarget:self action:@selector(resetView) forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:self action:@selector(shareButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    
    self.canvasView.delegate = self;
}

- (void) startDrawing {
    [self.canvasView startDrowings: self.lineColors timer: self.timer];
    [self.openTimerButton setEnabled:NO];
    [self.drawButton setEnabled:NO];
    [self.openPaletteButton setEnabled:NO];
}

- (void) drowingWasEnded {
    [self.shareButton setEnabled: YES];
    [self.drawButton setHidden:YES];
    [self.resetButton setHidden:NO];
    
}

- (void) resetView {
    [self.openPaletteButton setEnabled:YES];
    [self.drawButton setEnabled:YES];
    [self.openTimerButton setEnabled:YES];
    [self.drawButton setHidden:NO];
    [self.resetButton setHidden:YES];
    [self.shareButton setEnabled: NO];
    
    [self.canvasView clearView];
    self.timer = 1.0f;
    self.lineColors = nil;
    
}

- (void) openPalette {
   // [self.openPaletteButton setSelected:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: NSBundle.mainBundle];
    PaletteVC *palette = [storyboard instantiateViewControllerWithIdentifier:@"PaletteVC"];
    [self showChildViewController: palette];
    
    palette.delegate = self;
    self.paletteVC = palette;
}

- (void)saveColorsButtonTapped: (NSArray<UIColor *>*) colors {
    self.lineColors = [[NSArray alloc] initWithArray:colors];
    [self hideChildViewController: self.paletteVC];
   // self.paletteVC = nil;
}

- (void) openTimer {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: NSBundle.mainBundle];
    TimerViewController *timerVC = [storyboard instantiateViewControllerWithIdentifier:@"TimerVC"];
    [self showChildViewController: timerVC];
    timerVC.delegate = self;
    
    self.timerVC = timerVC;
   // self.timerVC = nil;
}

- (void) saveTimerButtonTapped: (float) timerValue {
    self.timer = timerValue;
    [self hideChildViewController: self.timerVC];
    self.timerVC = nil;
}

- (void) showChildViewController: (UIViewController *) viewController {
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    
    viewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [viewController.view.heightAnchor constraintEqualToConstant:self.view.bounds.size.height/2].active = YES;
    [viewController.view.widthAnchor constraintEqualToConstant:self.view.bounds.size.width].active = YES;
    [viewController.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0].active = YES;
    [viewController didMoveToParentViewController:self];
}

- (void) hideChildViewController: (UIViewController *) viewController {
    [viewController willMoveToParentViewController:nil];
    //Remove any constraints that you configured with the child’s root view.
   // Remove the child’s root view from your container’s view hierarchy.
    [viewController.view removeFromSuperview];
   // Call the child’s removeFromParentViewController method to finalize the end of the parent-child relationship.
    [viewController removeFromParentViewController];
}

- (void) shareButtonTapped {
    UIImage *image = self.canvasView.saveAsImage;
    NSArray *items = @[image];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
//    activityViewControntroller.excludedActivityTypes = @[];

    [self presentViewController:activityViewControntroller animated:true completion:nil];
    
    
}

@end
