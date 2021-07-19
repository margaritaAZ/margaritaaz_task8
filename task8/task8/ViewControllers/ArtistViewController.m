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


@interface ArtistViewController () <PaletteDelegate, CanvasViewDelegate>
@property (weak, nonatomic) IBOutlet AButton *shareButton;
@property (weak, nonatomic) IBOutlet AButton *openPaletteButton;
//@property (weak, nonatomic) IBOutlet UIView *paletteView;
@property (weak,nonatomic) PaletteVC *paletteVC;
@property (weak, nonatomic) IBOutlet AButton *drawButton;
@property (weak, nonatomic) IBOutlet CanvasView *canvasView;
@property (strong, nonatomic) NSArray<UIColor *>* lineColors;
@property (weak, nonatomic) IBOutlet AButton *resetButton;
@property (weak, nonatomic) IBOutlet AButton *openTimerButton;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.shareButton setEnabled:NO];
    
    [self.paletteVC.view setHidden:YES];
    [self.openPaletteButton addTarget:self action:@selector(openPalette) forControlEvents:UIControlEventTouchUpInside];
    [self.drawButton addTarget:self action:@selector(startDrawing) forControlEvents:UIControlEventTouchUpInside];
    [self.resetButton addTarget:self action:@selector(resetView) forControlEvents:UIControlEventTouchUpInside];
    
    self.canvasView.delegate = self;
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//}

- (void) startDrawing {
    [self.canvasView startDrowings:self.lineColors];
    [self.openTimerButton setEnabled:NO];
    [self.drawButton setEnabled:NO];
    [self.openPaletteButton setEnabled:NO];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqual:@"openPalette"]) {
//        //  [self.paletteView setHidden:NO];
//    }
//}
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
    self.lineColors = nil;
    
}

- (void) openPalette {
   // [self.openPaletteButton setSelected:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: NSBundle.mainBundle];
    PaletteVC *palette = [storyboard instantiateViewControllerWithIdentifier:@"PaletteVC"];
    [self addChildViewController:palette];
    [self.view addSubview:palette.view];
    
    palette.view.translatesAutoresizingMaskIntoConstraints = NO;
    [palette.view.heightAnchor constraintEqualToConstant:self.view.bounds.size.height/2].active = YES;
    [palette.view.widthAnchor constraintEqualToConstant:self.view.bounds.size.width].active = YES;
    [palette.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0].active = YES;
    
    [palette didMoveToParentViewController:self];
    
    palette.delegate = self;
    self.paletteVC = palette;
    
    [self.paletteVC.view setHidden:NO];
}

- (void)saveColorsButtonTapped: (NSArray<UIColor *>*) colors {
    self.lineColors = [[NSArray alloc] initWithArray:colors];
    [self removeChildViewController];
}

- (void) removeChildViewController {
    [self.paletteVC.view setHidden:YES];
    [self.paletteVC willMoveToParentViewController:nil];
    //Remove any constraints that you configured with the child’s root view.

   // Remove the child’s root view from your container’s view hierarchy.
    [self.paletteVC.view removeFromSuperview];
   // Call the child’s removeFromParentViewController method to finalize the end of the parent-child relationship.
    [self.paletteVC removeFromParentViewController];
    self.paletteVC = nil;
}

@end
