//
//  AKBallWithinTheBoxReverb.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKStereoAudio.h"
#import "AKParameter+Operation.h"

/** A physical model reverberator.

 Physical model reverberator based on the paper by Davide Rocchesso 'The Ball within the Box - a sound-processing metaphor', Computer Music Journal, Vol 19, N.4, pp.45-47, Winter 1995.
 */

@interface AKBallWithinTheBoxReverb : AKStereoAudio
/// Instantiates the ball within the box reverb with all values
/// @param input The input audio signal. [Default Value: ]
/// @param lengthOfXAxisEdge Length of x-axis edge of the box in meters. [Default Value: 14.39]
/// @param lengthOfYAxisEdge Length of y-axis edge of the box in meters. [Default Value: 11.86]
/// @param lengthOfZAxisEdge Length of z-axis edge of the box in meters. [Default Value: 10]
/// @param xLocation The virtual x-coordinate of the source of sound (the input signal). Updated at Control-rate. [Default Value: 6]
/// @param yLocation The virtual y-coordinate of the source of sound (the input signal). Updated at Control-rate. [Default Value: 4]
/// @param zLocation The virtual z-coordinate of the source of sound (the input signal). Updated at Control-rate. [Default Value: 3]
/// @param diffusion Coefficient of diffusion at the walls, which regulates the amount of diffusion (0-1, where 0 = no diffusion, 1 = maximum diffusion, default= 1) [Default Value: 1]
- (instancetype)initWithInput:(AKParameter *)input
            lengthOfXAxisEdge:(AKConstant *)lengthOfXAxisEdge
            lengthOfYAxisEdge:(AKConstant *)lengthOfYAxisEdge
            lengthOfZAxisEdge:(AKConstant *)lengthOfZAxisEdge
                    xLocation:(AKParameter *)xLocation
                    yLocation:(AKParameter *)yLocation
                    zLocation:(AKParameter *)zLocation
                    diffusion:(AKConstant *)diffusion;

/// Instantiates the ball within the box reverb with default values
/// @param input The input audio signal.
- (instancetype)initWithInput:(AKParameter *)input;

/// Instantiates the ball within the box reverb with default values
/// @param input The input audio signal.
+ (instancetype)reverbWithInput:(AKParameter *)input;

/// Length of x-axis edge of the box in meters. [Default Value: 14.39]
@property AKConstant *lengthOfXAxisEdge;

/// Set an optional length of x axis edge
/// @param lengthOfXAxisEdge Length of x-axis edge of the box in meters. [Default Value: 14.39]
- (void)setOptionalLengthOfXAxisEdge:(AKConstant *)lengthOfXAxisEdge;

/// Length of y-axis edge of the box in meters. [Default Value: 11.86]
@property AKConstant *lengthOfYAxisEdge;

/// Set an optional length of y axis edge
/// @param lengthOfYAxisEdge Length of y-axis edge of the box in meters. [Default Value: 11.86]
- (void)setOptionalLengthOfYAxisEdge:(AKConstant *)lengthOfYAxisEdge;

/// Length of z-axis edge of the box in meters. [Default Value: 10]
@property AKConstant *lengthOfZAxisEdge;

/// Set an optional length of z axis edge
/// @param lengthOfZAxisEdge Length of z-axis edge of the box in meters. [Default Value: 10]
- (void)setOptionalLengthOfZAxisEdge:(AKConstant *)lengthOfZAxisEdge;

/// The virtual x-coordinate of the source of sound (the input signal). [Default Value: 6]
@property AKParameter *xLocation;

/// Set an optional x location
/// @param xLocation The virtual x-coordinate of the source of sound (the input signal). Updated at Control-rate. [Default Value: 6]
- (void)setOptionalXLocation:(AKParameter *)xLocation;

/// The virtual y-coordinate of the source of sound (the input signal). [Default Value: 4]
@property AKParameter *yLocation;

/// Set an optional y location
/// @param yLocation The virtual y-coordinate of the source of sound (the input signal). Updated at Control-rate. [Default Value: 4]
- (void)setOptionalYLocation:(AKParameter *)yLocation;

/// The virtual z-coordinate of the source of sound (the input signal). [Default Value: 3]
@property AKParameter *zLocation;

/// Set an optional z location
/// @param zLocation The virtual z-coordinate of the source of sound (the input signal). Updated at Control-rate. [Default Value: 3]
- (void)setOptionalZLocation:(AKParameter *)zLocation;

/// Coefficient of diffusion at the walls, which regulates the amount of diffusion (0-1, where 0 = no diffusion, 1 = maximum diffusion, default= 1) [Default Value: 1]
@property AKConstant *diffusion;

/// Set an optional diffusion
/// @param diffusion Coefficient of diffusion at the walls, which regulates the amount of diffusion (0-1, where 0 = no diffusion, 1 = maximum diffusion, default= 1) [Default Value: 1]
- (void)setOptionalDiffusion:(AKConstant *)diffusion;



@end
