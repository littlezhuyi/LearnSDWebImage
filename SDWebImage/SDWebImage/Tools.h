//
//  Tools.h
//  SDWebImage
//
//  Created by 朱逸 on 2017/11/13.
//  Copyright © 2017年 github.com/littlezhuyi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *(^Com) (NSString *name);

@interface Tools : NSObject

@property (nonatomic, copy) Com complet;

- (void)test:(void (^)(NSString *name))block;

- (void)testOne:(NSString *(^)(NSString *name))block;

- (NSString *)fff;

@end
