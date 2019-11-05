//
//  Quen.m
//  GCDTest
//
//  Created by Judith on 2019/11/5.
//  Copyright © 2019 Judith. All rights reserved.
//

#import "Quen.h"

@implementation Quen
+ (void)quenTest {
    NSLog(@"串行异步 start");
    //串行异步
    dispatch_queue_t serialAsync = dispatch_queue_create("Judith_SerialAQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialAsync, ^{
        NSLog(@"serial async thread is %@",[NSThread currentThread]);
    });
    NSLog(@"串行异步 end");
    //串行同步
    NSLog(@"串行同步 start");
    dispatch_queue_t serialSync = dispatch_queue_create("Judith_SerialSQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serialSync, ^{
        NSLog(@"serial sync thread is %@",[NSThread currentThread]);
    });
    NSLog(@"串行同步 end");
    //并行同步
    NSLog(@"并行同步 start");
    dispatch_queue_t concurrentSync = dispatch_queue_create("Judith_ConcurrentSQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(concurrentSync, ^{
        NSLog(@"concurrent sync thread is %@",[NSThread currentThread]);
    });
    NSLog(@"并行同步 end");
    //并行异步
    NSLog(@"并行异步 start");
    dispatch_queue_t concurrentAsync = dispatch_queue_create("Judith_ConcurrentAQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentAsync, ^{
        NSLog(@"concurrent async thread is %@",[NSThread currentThread]);
    });
    NSLog(@"并行异步 end");

    //全局队列同步
    NSLog(@"全局队列同步 start");
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"global queue sync thread is %@",[NSThread currentThread]);
    });
    NSLog(@"全局队列同步 end");
    //全局队列异步
    NSLog(@"全局队列异步 start");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"global queue async thread is %@",[NSThread currentThread]);
    });
    NSLog(@"全局队列异步 end");
    
    //主队列同步  死锁
    NSLog(@"主队列同步 start");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"main queue sync thread is %@",[NSThread currentThread]);
    });
    NSLog(@"主队列同步 end");
    
}
@end
