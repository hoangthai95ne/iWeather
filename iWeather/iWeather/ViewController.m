//
//  ViewController.m
//  iWeather
//
//  Created by Hoàng Thái on 12/12/15.
//  Copyright © 2015 HOANGTHAI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *qoute;
@property (weak, nonatomic) IBOutlet UILabel *Celcius;

@end

@implementation ViewController
{
    NSArray* qoutes;
    NSArray* locations;
    NSArray* photoFiles;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    qoutes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Công cha như núi Thái Sơn", @"Nghĩa mẹ như nước trong nguồn chảy ra", @"Đi một ngày đàng học một sàng khôn"];
    locations = @[@"New York, USA", @"Tokyo, Japan", @"Ho Chi Minh, VN", @"Sydney, Australia"];
    photoFiles = @[@"Rain", @"Windy", @"Sunny", @"Thunder"];
}

- (IBAction)updateWeather:(id)sender {
    int qouteIndex = arc4random_uniform(qoutes.count);
    self.qoute.text = qoutes[qouteIndex];
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    self.Celcius.text = @"C";
}

- (float) getTemperature {
    return 14 + arc4random_uniform(18) + (float)arc4random()/(float) INT32_MAX;
}

//Bai tap ve nha
// F = 1.8 * C + 32;

- (IBAction)convertTemperature:(id)sender {
    self.Celcius.text = @"F";
    NSString* string1 = [NSString stringWithFormat:@"%2.1f", [self getFarenheight]];
    [self.temperature setTitle:string1 forState:UIControlStateNormal];
}

- (float)getFarenheight {
    return (float)(1.8 * [self getTemperature] + 32);
}

@end
