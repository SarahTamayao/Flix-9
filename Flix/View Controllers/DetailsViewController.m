//
//  DetailsViewController.m
//  Flix
//
//  Created by Sabrina P Meng on 6/23/21.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TrailerViewController.h"
#import "FullPosterViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer2;



@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set navigation title to the current movie
    self.navigationItem.title = self.movie[@"title"];
    
    // Poster image
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.posterView setImageWithURL:posterURL];
    
    // Background image
    NSString *backdropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    [self.backdropView setImageWithURL:backdropURL];
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"overview"];
    
    // [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit];
    
    // Allow background image to be tappable
    [self.backdropView setUserInteractionEnabled:true];
    [self.backdropView addGestureRecognizer:self.tapRecognizer];
    [self.posterView setUserInteractionEnabled:true];
    [self.posterView addGestureRecognizer:self.tapRecognizer2];
    
}

-(void)viewDidAppear:(BOOL)animated {
}

-(void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    bool darkModeStatus = [defaults boolForKey:@"dark_mode_on"];
    
    if (darkModeStatus) {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
    }
    else {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Send movie info to trailer view
    TrailerViewController *trailerViewController = [segue destinationViewController];
    trailerViewController.movie = self.movie;
    
    FullPosterViewController *fullPosterViewController = [segue destinationViewController];
    fullPosterViewController.movie = self.movie;
}


@end
