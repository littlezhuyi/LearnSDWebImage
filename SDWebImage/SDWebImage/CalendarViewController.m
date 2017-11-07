//
//  CalendarViewController.m
//  SDWebImage
//
//  Created by 朱逸 on 2017/11/3.
//  Copyright © 2017年 github.com/littlezhuyi. All rights reserved.
//

#import "CalendarViewController.h"
#import "FSCalendar.h"

@interface CalendarViewController ()<FSCalendarDelegate, FSCalendarDataSource>

@property (weak, nonatomic) IBOutlet FSCalendar *calendar;

@property (nonatomic, strong) NSDictionary *images;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

@end
