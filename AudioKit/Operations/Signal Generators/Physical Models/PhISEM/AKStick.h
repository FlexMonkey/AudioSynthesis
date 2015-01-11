//
//  AKStick.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Semi-physical model of a stick sound.

 This one of the PhISEM percussion opcodes. PhISEM (Physically Informed Stochastic Event Modeling) is an algorithmic approach for simulating collisions of multiple independent sound producing objects.
 */

@interface AKStick : AKAudio
/// Instantiates the stick with all values
/// @param intensity The intensity of the stick sound. [Default Value: 30]
/// @param dampingFactor This value ranges from 0 to 1, from undamped to fully damped. [Default Value: 0.3]
/// @param amplitude Amplitude of output. As these instruments are stochastic this is only a approximation. [Default Value: 1]
- (instancetype)initWithIntensity:(AKConstant *)intensity
                    dampingFactor:(AKConstant *)dampingFactor
                        amplitude:(AKConstant *)amplitude;

/// Instantiates the stick with default values
- (instancetype)init;

/// Instantiates the stick with default values
+ (instancetype)stick;


/// The intensity of the stick sound. [Default Value: 30]
@property AKConstant *intensity;

/// Set an optional intensity
/// @param intensity The intensity of the stick sound. [Default Value: 30]
- (void)setOptionalIntensity:(AKConstant *)intensity;

/// This value ranges from 0 to 1, from undamped to fully damped. [Default Value: 0.3]
@property AKConstant *dampingFactor;

/// Set an optional damping factor
/// @param dampingFactor This value ranges from 0 to 1, from undamped to fully damped. [Default Value: 0.3]
- (void)setOptionalDampingFactor:(AKConstant *)dampingFactor;

/// Amplitude of output. As these instruments are stochastic this is only a approximation. [Default Value: 1]
@property AKConstant *amplitude;

/// Set an optional amplitude
/// @param amplitude Amplitude of output. As these instruments are stochastic this is only a approximation. [Default Value: 1]
- (void)setOptionalAmplitude:(AKConstant *)amplitude;



@end
