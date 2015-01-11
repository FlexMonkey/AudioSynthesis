//
//  AKCrunch.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Semi-physical model of a crunch sound.

 This one of the PhISEM percussion opcodes. PhISEM (Physically Informed Stochastic Event Modeling) is an algorithmic approach for simulating collisions of multiple independent sound producing objects.
 */

@interface AKCrunch : AKAudio
/// Instantiates the crunch with all values
/// @param intensity The intensity of the crunch sound [Default Value: 100]
/// @param dampingFactor Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.1]
/// @param amplitude Amplitude of output. As these instruments are stochastic this is only a approximation. [Default Value: 1]
- (instancetype)initWithIntensity:(AKConstant *)intensity
                    dampingFactor:(AKConstant *)dampingFactor
                        amplitude:(AKConstant *)amplitude;

/// Instantiates the crunch with default values
- (instancetype)init;

/// Instantiates the crunch with default values
+ (instancetype)crunch;


/// The intensity of the crunch sound [Default Value: 100]
@property AKConstant *intensity;

/// Set an optional intensity
/// @param intensity The intensity of the crunch sound [Default Value: 100]
- (void)setOptionalIntensity:(AKConstant *)intensity;

/// Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.1]
@property AKConstant *dampingFactor;

/// Set an optional damping factor
/// @param dampingFactor Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.1]
- (void)setOptionalDampingFactor:(AKConstant *)dampingFactor;

/// Amplitude of output. As these instruments are stochastic this is only a approximation. [Default Value: 1]
@property AKConstant *amplitude;

/// Set an optional amplitude
/// @param amplitude Amplitude of output. As these instruments are stochastic this is only a approximation. [Default Value: 1]
- (void)setOptionalAmplitude:(AKConstant *)amplitude;



@end
