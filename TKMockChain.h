//
//  TKMockChain.h
//
//  Created by Taras Kalapun on 2/13/15.
//  Copyright (c) 2015 Taras Kalapun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TKMockChainBlock)();

@interface TKMockChain : NSObject

+ (void)sleepBetween:(NSTimeInterval)ti chain:(TKMockChainBlock)firstBlock, ... NS_REQUIRES_NIL_TERMINATION;
+ (void)sleepBetween:(NSTimeInterval)ti beforeEach:(TKMockChainBlock)beforeEachBlock afterEach:(TKMockChainBlock)afterEachBlock chain:(TKMockChainBlock)firstBlock, ... NS_REQUIRES_NIL_TERMINATION;

@end
