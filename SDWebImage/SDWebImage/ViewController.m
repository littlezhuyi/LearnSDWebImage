//
//  ViewController.m
//  SDWebImage
//
//  Created by 朱逸 on 2017/11/1.
//  Copyright © 2017年 github.com/littlezhuyi. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "CalendarViewController.h"
#import "Tools.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.imageViewOne sd_setImageWithURL:[NSURL URLWithString:@"https://images.apple.com/v/iphone-x/e/images/overview/primary/design_all_new_large_2x.jpg"]];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.imageViewOne sd_setImageWithURL:[NSURL URLWithString:@"https://images.apple.com/v/iphone-x/e/images/overview/primary/dual_cameras_smart_cameras_large_2x.jpg"]];
//    });
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.imageViewOne sd_setImageWithURL:[NSURL URLWithString:@"https://images.apple.com/cn/iphone-x/images/overview/primary/face_id_hero_large_2x.jpg"]];
//    });
}

- (IBAction)calendar:(UIButton *)sender {
    [self presentViewController:[CalendarViewController new] animated:YES completion:nil];
}
@end
