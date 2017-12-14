// AFNetworkReachabilityManager.h
// Copyright (c) 2011–2016 Alamofire Software Foundation ( http://alamofire.org/ )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

#if !TARGET_OS_WATCH
#import <SystemConfiguration/SystemConfiguration.h>

typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
    /*
     *  未知
     */
    AFNetworkReachabilityStatusUnknown          = -1,
    /*
     *  不可用
     */
    AFNetworkReachabilityStatusNotReachable     = 0,
    /*
     *  手机自带网络
     */
    AFNetworkReachabilityStatusReachableViaWWAN = 1,
    /*
     *  WiFi
     */
    AFNetworkReachabilityStatusReachableViaWiFi = 2,
};

/*
 *  在 NS_ASSUME_NONNULL_BEGIN 和 NS_ASSUME_NONNULL_END 之间的对象不可以为null
 */
NS_ASSUME_NONNULL_BEGIN

@interface AFNetworkReachabilityManager : NSObject

#pragma mark - Property

/*
 *  当前网络状态
 */
@property (readonly, nonatomic, assign) AFNetworkReachabilityStatus networkReachabilityStatus;

/*
 *  当前网络是否可用
 */
@property (readonly, nonatomic, assign, getter = isReachable) BOOL reachable;

/*
 *  当前网络是否是手机自带网络
 */
@property (readonly, nonatomic, assign, getter = isReachableViaWWAN) BOOL reachableViaWWAN;

/*
 *  是否是WiFi
 */
@property (readonly, nonatomic, assign, getter = isReachableViaWiFi) BOOL reachableViaWiFi;

#pragma mark - Method

/*
 *  Returns the shared network reachability manager.
 */
+ (instancetype)sharedManager;

/**
 *  Creates and returns a network reachability manager with the default socket address.
 *
 *  @return An initialized network reachability manager, actively monitoring the default socket address.
 */
+ (instancetype)manager;

/**
 *  Creates and returns a network reachability manager for the specified domain.
 *
 *  @param domain The domain used to evaluate network reachability.
 *
 *  @return An initialized network reachability manager, actively monitoring the specified domain.
 */
+ (instancetype)managerForDomain:(NSString *)domain;

/**
 *  Creates and returns a network reachability manager for the socket address.
 *
 *  @param address The socket address (`sockaddr_in6`) used to evaluate network reachability.
 *
 *  @return An initialized network reachability manager, actively monitoring the specified socket address.
 */
+ (instancetype)managerForAddress:(const void *)address;

/**
 *  Initializes an instance of a network reachability manager from the specified reachability object.
 *
 *  @param reachability The reachability object to monitor.
 *
 *  @return An initialized network reachability manager, actively monitoring the specified reachability.
 */
- (instancetype)initWithReachability:(SCNetworkReachabilityRef)reachability NS_DESIGNATED_INITIALIZER;

#pragma mark - Starting & Stopping Reachability Monitoring

/**
 Starts monitoring for changes in network reachability status.
 */
- (void)startMonitoring;

/**
 Stops monitoring for changes in network reachability status.
 */
- (void)stopMonitoring;

#pragma mark -  Getting Localized Reachability Description

/**
 *  Returns a localized string representation of the current network reachability status.
 */
- (NSString *)localizedNetworkReachabilityStatusString;

#pragma mark - Setting Network Reachability Change Callback

/**
 Sets a callback to be executed when the network availability of the `baseURL` host changes.

 @param block A block object to be executed when the network availability of the `baseURL` host changes.. This block has no return value and takes a single argument which represents the various reachability states from the device to the `baseURL`.
 */
- (void)setReachabilityStatusChangeBlock:(nullable void (^)(AFNetworkReachabilityStatus status))block;

@end

FOUNDATION_EXPORT NSString * const AFNetworkingReachabilityDidChangeNotification;
FOUNDATION_EXPORT NSString * const AFNetworkingReachabilityNotificationStatusItem;

#pragma mark - Functions

/**
 Returns a localized string representation of an `AFNetworkReachabilityStatus` value.
 */
FOUNDATION_EXPORT NSString * AFStringFromNetworkReachabilityStatus(AFNetworkReachabilityStatus status);

NS_ASSUME_NONNULL_END
#endif
