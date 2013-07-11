//
//  ViewController.h
//  BikeTracker
//
//  Created by Przemysław Dąbek on 6/30/13.
//  Copyright (c) 2013 Przemysław Dąbek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property CLLocationManager *locationManager;

- (void)track:(UIButton *)sender;

@end
