//
//  TKMockChain.m
//
//  Created by Taras Kalapun on 2/13/15.
//  Copyright (c) 2015 Taras Kalapun. All rights reserved.
//

#import "TKMockChain.h"

@implementation TKMockChain


// execute synchroniously all blocks on main thread and sleep `X` seconds between them
+ (void)sleepBetween:(NSTimeInterval)ti chain:(TKMockChainBlock)firstBlock, ... NS_REQUIRES_NIL_TERMINATION
{
    NSMutableArray *arr = [NSMutableArray array];
    
    va_list args;
    va_start(args, firstBlock);
    
    // load each block into the list
    TKMockChainBlock block = firstBlock;
    
    while (block) {
        [arr addObject:block];
        block = va_arg(args, TKMockChainBlock);
    }
    
    va_end(args);
    
    [self _sleepBetween:ti beforeEach:nil afterEach:nil chainBlocks:arr];
}

+ (void)sleepBetween:(NSTimeInterval)ti beforeEach:(TKMockChainBlock)beforeEachBlock afterEach:(TKMockChainBlock)afterEachBlock chain:(TKMockChainBlock)firstBlock, ... NS_REQUIRES_NIL_TERMINATION
{
    NSMutableArray *arr = [NSMutableArray array];
    
    va_list args;
    va_start(args, firstBlock);
    
    // load each block into the list
    TKMockChainBlock block = firstBlock;
    
    while (block) {
        [arr addObject:block];
        block = va_arg(args, TKMockChainBlock);
    }
    
    va_end(args);
    
    [self _sleepBetween:ti beforeEach:beforeEachBlock afterEach:afterEachBlock chainBlocks:arr];
}

+ (void)_sleepBetween:(NSTimeInterval)ti beforeEach:(TKMockChainBlock)beforeEachBlock afterEach:(TKMockChainBlock)afterEachBlock chainBlocks:(NSArray *)blocks
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // background code
        
        dispatch_queue_t myQueue = dispatch_queue_create("com.kalapun.chainmocker", NULL);
        for (TKMockChainBlock block in blocks) {
            
            dispatch_sync(myQueue, ^{
                if (beforeEachBlock) {
                    dispatch_async(dispatch_get_main_queue(), beforeEachBlock);
                }
                dispatch_async(dispatch_get_main_queue(), block);
                if (afterEachBlock) {
                    dispatch_async(dispatch_get_main_queue(), afterEachBlock);
                }
            });
            
            dispatch_sync(myQueue, ^{
                [NSThread sleepForTimeInterval:ti];
            });
            
        }
        
    });
}


@end
