//
//  AKLowPassButterworthFilter.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** A low-pass Butterworth filter.

 These filters are Butterworth second-order IIR filters. They offer an almost flat passband and very good precision and stopband attenuation.
 */

@interface AKLowPassButterworthFilter : AKAudio
/// Instantiates the low pass butterworth filter with all values
/// @param input Input signal to be filtered. [Default Value: ]
/// @param cutoffFrequency Cutoff frequency for each of the filters. Updated at Control-rate. [Default Value: 1000]
- (instancetype)initWithInput:(AKParameter *)input
              cutoffFrequency:(AKParameter *)cutoffFrequency;

/// Instantiates the low pass butterworth filter with default values
/// @param input Input signal to be filtered.
- (instancetype)initWithInput:(AKParameter *)input;

/// Instantiates the low pass butterworth filter with default values
/// @param input Input signal to be filtered.
+ (instancetype)filterWithInput:(AKParameter *)input;

/// Cutoff frequency for each of the filters. [Default Value: 1000]
@property AKParameter *cutoffFrequency;

/// Set an optional cutoff frequency
/// @param cutoffFrequency Cutoff frequency for each of the filters. Updated at Control-rate. [Default Value: 1000]
- (void)setOptionalCutoffFrequency:(AKParameter *)cutoffFrequency;



@end
