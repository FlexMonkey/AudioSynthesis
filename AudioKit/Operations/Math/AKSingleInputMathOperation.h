//
//  AKSingleInputMathOperation.h
//  AudioKit
//
//  Created by Aurelius Prochazka on 2/21/15.
//  Copyright (c) 2015 AudioKit. All rights reserved.
//

#import "AKParameter+Operation.h"

/// A base-class for operations that only require one input
@interface AKSingleInputMathOperation : AKParameter

/// Generic operation with one input///
/// @param function The string that defines the function internally
/// @param input    The input parameter
- (instancetype)initWithFunctionString:(NSString *)function
                                 input:(AKParameter *)input;
@end
