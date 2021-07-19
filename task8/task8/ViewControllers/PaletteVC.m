//
//  PaletteVC.m
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

#import "PaletteVC.h"
#import "ColorButton.h"
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
    
    [self.redButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.grayButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.darkBlueButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.greenButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.purpleButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.peachButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.orangeButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.blueButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.pinkButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.sapphirineButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.viridButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.burgundyButton addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.saveButton addTarget:self action:@selector(saveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) colorSelected: (ColorButton *) button {
    if ([self.pickedColors containsObject:button]) {
        [button setSelected:NO];
        [self.pickedColors removeObject:button];
    } else {
        if (self.pickedColors.count > 2) {
            ColorButton *firstColor = self.pickedColors.firstObject;
            [self.pickedColors removeObject:firstColor];
            [firstColor setSelected:NO];
        }
        self.view.backgroundColor = button.color;
        [button setSelected:YES];
        [self.pickedColors addObject:button];
    }
}

- (void) saveButtonTapped: (id)sender {
    NSMutableArray *colors = [NSMutableArray new];
    for (int i = 0; i < self.pickedColors.count; i++) {
        [colors addObject:self.pickedColors[i].color];
    }
    [self.delegate saveColorsButtonTapped:[colors copy]];
    
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
