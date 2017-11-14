//
//  Tools.m
//  SDWebImage
//
//  Created by 朱逸 on 2017/11/13.
//  Copyright © 2017年 github.com/littlezhuyi. All rights reserved.
//

#import "Tools.h"



@implementation Tools

- (void)test:(void (^)(NSString *name))block {
    block(@"xiaozhu");
}

- (void)testOne:(NSString *(^)(NSString *name))block {
    NSString *zz = block(@"xiaohua");
    NSLog(@"%@",zz);
}

- (NSString *)fff {
    return self.complet(@"xiaozhang");
}

@end
