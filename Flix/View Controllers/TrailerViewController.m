//
//  TrailerViewController.m
//  Flix
//
//  Created by Sabrina P Meng on 6/24/21.
//

#import "TrailerViewController.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import <WebKit/WebKit.h>

@interface TrailerViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *trailerView;

@end

@implementation TrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchTrailer];
}

- (void)isDataSourceAvailable {
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No Connection" message:@"Please check your internet connection and try again."
            preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {}];

        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)fetchTrailer {
    [self isDataSourceAvailable];
    NSString *movieID = self.movie[@"id"];
    NSString *movieAPI = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed", movieID];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSURL *url = [NSURL URLWithString:movieAPI];
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
               if (error != nil) {
                   NSLog(@"%@", [error localizedDescription]);
               }
               else {
                   NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                   
                   if (dataDictionary) {
                       NSDictionary *results = dataDictionary[@"results"][0];
                       NSString *movieKey = results[@"key"];
                       NSString *movieURLString = [NSString stringWithFormat:@"https://www.youtube.com/watch?v=%@", movieKey];
                       
                       // Convert the url String to a NSURL object
                       NSURL *movieURL = [NSURL URLWithString:movieURLString];
                       
                       // Place the URL in a URL Request.
                       NSURLRequest *request = [NSURLRequest requestWithURL:movieURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
                       
                       // Load Request into WebView
                       [self.trailerView loadRequest:request];
                   }
                   else {
                       UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No Trailer Available" message:@"Sorry, there is no trailer available for this movie."
                           preferredStyle:UIAlertControllerStyleAlert];

                       UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action) {}];

                       [alert addAction:defaultAction];
                       [self presentViewController:alert animated:YES completion:nil];
                   }
               }
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            });
        }];
        [task resume];
    });
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
