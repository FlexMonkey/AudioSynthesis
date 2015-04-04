//
//  AKDifference.h
//  AudioKit
//
//  Created by Aurelius Prochazka on 2/21/15.
//  Copyright (c) 2015 AudioKit. All rights reserved.
//

#import "AKParameter+Operation.h"

/** Subtracts any number of a-rate signals.
 */

@interface AKDifference : AKParameter

/// Create a new signal as a sum of exactly two given signals.
/// @param minuend    The input the subtrahend will be subtracted from
/// @param subtrahend The value to be subtracted from the minend
- (instancetype)initWithInput:(AKParameter *)minuend
                        minus:(AKParameter *)subtrahend;
@end
