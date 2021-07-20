//
//  PaletteVC.m
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

#import "PaletteVC.h"
#import "AButton.h"

@interface PaletteVC ()
@property (weak, nonatomic) IBOutlet AButton *saveButton;
@property (weak, nonatomic) IBOutlet ColorButton *redButton;
@property (weak, nonatomic) IBOutlet ColorButton *darkBlueButton;
@property (weak, nonatomic) IBOutlet ColorButton *greenButton;
@property (weak, nonatomic) IBOutlet ColorButton *grayButton;
@property (weak, nonatomic) IBOutlet ColorButton *purpleButton;
@property (weak, nonatomic) IBOutlet ColorButton *peachButton;
@property (weak, nonatomic) IBOutlet ColorButton *orangeButton;
@property (weak, nonatomic) IBOutlet ColorButton *blueButton;
@property (weak, nonatomic) IBOutlet ColorButton *pinkButton;
@property (weak, nonatomic) IBOutlet ColorButton *sapphirineButton;
@property (weak, nonatomic) IBOutlet ColorButton *viridButton;
@property (weak, nonatomic) IBOutlet ColorButton *burgundyButton;

@property (strong, nonatomic) NSMutableArray<ColorButton *> *pickedColors;
@property (strong, nonatomic) NSArray<ColorButton *> *buttons;

@property (weak, nonatomic) NSTimer *timer;


@end

@implementation PaletteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pickedColors = [NSMutableArray new];
    
    self.view.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    self.view.layer.cornerRadius = 40;
    self.view.backgroundColor = UIColor.whiteColor;
    self.view.layer.shadowColor = UIColor.blackColor.CGColor;
    self.view.layer.shadowRadius = 4;
    self.view.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
    self.view.layer.shadowOpacity = 0.25;
    self.view.layer.masksToBounds = NO;
    self.view.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.view.bounds cornerRadius:40].CGPath;
    
    [self configureColorButtons];
    [self.saveButton addTarget:self action:@selector(saveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) colorSelected: (ColorButton *) button {
    if ([self.pickedColors containsObject:button]) {
        [self buttonAnimation:button wasSelected:NO];
    } else {
        if (self.pickedColors.count > 2) {
            ColorButton *firstColor = self.pickedColors.firstObject;
            [self button:firstColor wasSelected:NO];
        }
        self.view.backgroundColor = button.color;
        [self.timer invalidate];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                              target:self
                              selector:@selector(setDefaultBackgroundColor)
                              userInfo:nil repeats:NO];
        [self buttonAnimation:button wasSelected:YES];
        
    }
}

- (void) setDefaultBackgroundColor {
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void) setPickedButtons: (NSArray<UIColor *>*) colors {
    for (int i = 0; i < self.buttons.count; i++) {
        for (int j = 0; j < colors.count; j++) {
            if ([self.buttons[i].color isEqual:colors[j]]) {
                [self button:self.buttons[i] wasSelected:YES];
            }
        }
    }
}

- (void) button: (ColorButton *) button wasSelected: (BOOL) selected  {
    if (selected) {
        [button setSelected:YES];
        [self.pickedColors addObject:button];
    } else {
        [button setSelected:NO];
        [self.pickedColors removeObject:button];
    }
}

- (void) buttonAnimation: (ColorButton *) button wasSelected: (BOOL) selected  {
    if (selected) {
        [button setSelectedWithAnimation:YES];
        [self.pickedColors addObject:button];
    } else {
        [button setSelectedWithAnimation:NO];
        [self.pickedColors removeObject:button];
    }
}

- (void) saveButtonTapped: (id)sender {
    NSMutableArray *colors = [NSMutableArray new];
    for (int i = 0; i < self.pickedColors.count; i++) {
        [colors addObject:self.pickedColors[i].color];
    }
    [self.delegate saveColorsButtonTapped:[colors copy]];
}

- (void) configureColorButtons {
    [self.redButton setButtonColor: [UIColor colorNamed:@"Red"]];
    [self.grayButton setButtonColor: [UIColor colorNamed:@"Gray"]];
    [self.darkBlueButton setButtonColor: [UIColor colorNamed:@"Dark Blue"]];
    [self.greenButton setButtonColor: [UIColor colorNamed:@"Green"]];
    [self.purpleButton setButtonColor: [UIColor colorNamed:@"Violet"]];
    [self.peachButton setButtonColor: [UIColor colorNamed:@"Peach"]];
    [self.orangeButton setButtonColor: [UIColor colorNamed:@"Orange"]];
    [self.blueButton setButtonColor: [UIColor colorNamed:@"Blue"]];
    [self.pinkButton setButtonColor: [UIColor colorNamed:@"Pink"]];
    [self.sapphirineButton setButtonColor: [UIColor colorNamed:@"Sapphirine"]];
    [self.viridButton setButtonColor: [UIColor colorNamed:@"Virid"]];
    [self.burgundyButton setButtonColor: [UIColor colorNamed:@"Burgundy"]];
    
    NSMutableArray<ColorButton *>* buttons = [NSMutableArray new];
    [buttons addObject: self.redButton];
    [buttons addObject:self.grayButton];
    [buttons addObject: self.darkBlueButton];
    [buttons addObject: self.greenButton];
    [buttons addObject: self.purpleButton];
    [buttons addObject: self.peachButton];
    [buttons addObject: self.orangeButton];
    [buttons addObject: self.blueButton];
    [buttons addObject: self.pinkButton];
    [buttons addObject: self.sapphirineButton];
    [buttons addObject: self.viridButton];
    [buttons addObject: self.burgundyButton];
    
    self.buttons = buttons;
    
    for (int i = 0; i < buttons.count; i++) {
        [buttons[i] addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
}

@end
