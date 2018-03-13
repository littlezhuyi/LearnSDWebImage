//
//  ViewController.m
//  SDWebImage
//
//  Created by 朱逸 on 2017/11/1.
//  Copyright © 2017年 github.com/littlezhuyi. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sessionGet:(UIButton *)sender {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://httpbin.org/get?userID=18749618826"]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *J_error;
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&J_error];
        NSLog(@"%@",result);
    }];
    [task resume];
}

- (IBAction)sessionPost:(UIButton *)sender {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://httpbin.org/post"]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"userID=18749618826" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *J_error;
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&J_error];
        NSLog(@"%@",result);
    }];
    [task resume];
}

- (IBAction)AFGet:(UIButton *)sender {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameter = @{@"userID" : @"18749618826"};
    [manager GET:@"https://httpbin.org/get" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (IBAction)AFPost:(UIButton *)sender {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameter = @{@"userID" : @"18749618826"};
    [manager POST:@"https://httpbin.org/post" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (IBAction)clickButton:(id)sender {
//    //通过默认配置初始化Session
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//    //设置网络请求序列化对象
//    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
//    [requestSerializer setValue:@"test" forHTTPHeaderField:@"requestHeader"];
//    requestSerializer.timeoutInterval = 60;
//    requestSerializer.stringEncoding = NSUTF8StringEncoding;
//
//    //设置返回数据序列化对象
//    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer = responseSerializer;
//
//    //网络请求安全策略
//    if (true) {
//        AFSecurityPolicy *securityPolicy;
//        securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
//        securityPolicy.allowInvalidCertificates = false;
//        securityPolicy.validatesDomainName = YES;
//        manager.securityPolicy = securityPolicy;
//    } else { manager.securityPolicy.allowInvalidCertificates = true; manager.securityPolicy.validatesDomainName = false; } //是否允许请求重定向 if (true) { [manager setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest *(NSURLSession *session, NSURLSessionTask *task, NSURLResponse *response, NSURLRequest *request) { if (response) { return nil; } return request; }]; } //监听网络状态 [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) { NSLog(@"%ld",(long)status); }]; [manager.reachabilityManager startMonitoring]; NSURL *URL = [NSURL URLWithString:bigPic]; NSURLRequest *request = [NSURLRequest requestWithURL:URL]; NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress *downloadProgress){ NSLog(@"下载进度:%lld",downloadProgress.completedUnitCount); } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) { NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil]; NSURL *fileURL = [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]]; NSLog(@"fileURL:%@",[fileURL absoluteString]); return fileURL; } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) { self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:filePath]]; NSLog(@"File downloaded to: %@", filePath); }]; [downloadTask resume];
}

@end
