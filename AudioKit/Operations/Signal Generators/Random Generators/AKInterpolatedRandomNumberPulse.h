//
//  AKInterpolatedRandomNumberPulse.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKControl.h"
#import "AKParameter+Operation.h"

/** Generates a controlled random number series with interpolation between each new number.

 New random numbers are generated at a given frequency between zero and a maximum upper bound.  In between random numbers, the value of this operation is linearly interpolated between the two numbers in time.
 */

@interface AKInterpolatedRandomNumberPulse : AKControl
/// Instantiates the interpolated random number pulse with all values
/// @param upperBound Maximum maximum range limit.  Sampled values will be between 0 and this maximum Updated at Control-rate. [Default Value: 1]
/// @param frequency Frequency at which the new numbers are generated in Hz. Updated at Control-rate. [Default Value: 1]
- (instancetype)initWithUpperBound:(AKParameter *)upperBound
                         frequency:(AKParameter *)frequency;

/// Instantiates the interpolated random number pulse with default values
- (instancetype)init;

/// Instantiates the interpolated random number pulse with default values
+ (instancetype)pulse;


/// Maximum maximum range limit.  Sampled values will be between 0 and this maximum [Default Value: 1]
@property AKParameter *upperBound;

/// Set an optional upper bound
/// @param upperBound Maximum maximum range limit.  Sampled values will be between 0 and this maximum Updated at Control-rate. [Default Value: 1]
- (void)setOptionalUpperBound:(AKParameter *)upperBound;

/// Frequency at which the new numbers are generated in Hz. [Default Value: 1]
@property AKParameter *frequency;

/// Set an optional frequency
/// @param frequency Frequency at which the new numbers are generated in Hz. Updated at Control-rate. [Default Value: 1]
- (void)setOptionalFrequency:(AKParameter *)frequency;



@end
