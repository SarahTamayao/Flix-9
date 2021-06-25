//
//  SettingsViewController.m
//  Flix
//
//  Created by Sabrina P Meng on 6/25/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *darkModeSwitch;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.darkModeSwitch setOn:NO animated:YES];
}

-(void)viewDidAppear:(BOOL)animated {
}

-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"changing...");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    bool darkModeStatus = [defaults boolForKey:@"dark_mode_on"];
    int navColor = [defaults integerForKey:@"nav_color"];
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    NSLog(@"%@", [self colorWithHex:navColor]);
    navigationBar.tintColor = [UIColor colorWithRed:1.0 green:0.25 blue:0.25 alpha:0.8];
    
    if (darkModeStatus) {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
    }
    else {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    }
}

-(UIColor *)colorWithHex:(UInt32)col {
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

- (IBAction)onChange:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    bool darkModeStatus = [defaults boolForKey:@"dark_mode_on"];
    
    if (darkModeStatus) {
        darkModeStatus = false;
    }
    else {
        darkModeStatus = true;
    }
    [defaults setBool:darkModeStatus forKey:@"dark_mode_on"];
    [defaults synchronize];
    
    [self viewWillAppear:true];
}

- (IBAction)resetColor:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0xf7f7f7 forKey:@"nav_color"];
    [defaults synchronize];
    
    [self viewWillAppear:true];
}

- (IBAction)setColor1:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0x273598 forKey:@"nav_color"];
    [defaults synchronize];
    
    [self viewWillAppear:true];
}

- (IBAction)setColor2:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0xFFC081 forKey:@"nav_color"];
    [defaults synchronize];
    
    [self viewWillAppear:true];
}

- (IBAction)setColor3:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0x6BE495 forKey:@"nav_color"];
    [defaults synchronize];
    
    [self viewWillAppear:true];
}

- (IBAction)setColor4:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0xE23188 forKey:@"nav_color"];
    [defaults synchronize];
    
    [self viewWillAppear:true];
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
