//
//  ViewController.m
//  BikeTracker
//
//  Created by Przemysław Dąbek on 6/30/13.
//  Copyright (c) 2013 Przemysław Dąbek. All rights reserved.
//

#import "ViewController.h"
#import "AFJSONRequestOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *trackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    trackButton.frame = CGRectMake(100, 100, 100, 50);
    [trackButton setTitle:@"Track" forState:UIControlStateNormal];
    [self.view addSubview:trackButton];
    [trackButton addTarget:self action:@selector(track:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)track:(UIButton *)sender
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/routes"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSDictionary *route = @{@"uuid": [[NSUUID UUID] UUIDString], @"locations": @[ @[ @0, @50.0496957, @19.9382471 ] ]};
    NSLog(@"%@", [route description]);
    NSError *error = [[NSError alloc] init];
    NSData *data = [NSJSONSerialization dataWithJSONObject:route options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPBody:data];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSLog(@"%@", JSON);
        }
        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            NSLog(@"%d", [response statusCode]);
            NSLog(@"%@", JSON);
        }
    ];
    [operation start];
}

- (void)loadView
{
    CGRect viewRect = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:viewRect];
    self.view = view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
