//
//  AKMoogVCF.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** A digital emulation of the Moog diode ladder filter configuration.

 This emulation is based loosely on the paper “Analyzing the Moog VCF with Considerations for Digital Implementation” by Stilson and Smith (CCRMA). This version was originally coded in Csound by Josep Comajuncosas. Some modifications and conversion to C were done by Hans Mikelson and then adjusted.
 */

@interface AKMoogVCF : AKAudio
/// Instantiates the moog vcf with all values
/// @param input Input signal. [Default Value: ]
/// @param cutoffFrequency Filter cut-off frequency in Hz. [Default Value: 1000]
/// @param resonance Amount of resonance. Self-oscillation occurs when this is approximately one. [Default Value: 0.5]
- (instancetype)initWithInput:(AKParameter *)input
              cutoffFrequency:(AKParameter *)cutoffFrequency
                    resonance:(AKParameter *)resonance;

/// Instantiates the moog vcf with default values
/// @param input Input signal.
- (instancetype)initWithInput:(AKParameter *)input;

/// Instantiates the moog vcf with default values
/// @param input Input signal.
+ (instancetype)filterWithInput:(AKParameter *)input;

/// Filter cut-off frequency in Hz. [Default Value: 1000]
@property AKParameter *cutoffFrequency;

/// Set an optional cutoff frequency
/// @param cutoffFrequency Filter cut-off frequency in Hz. [Default Value: 1000]
- (void)setOptionalCutoffFrequency:(AKParameter *)cutoffFrequency;

/// Amount of resonance. Self-oscillation occurs when this is approximately one. [Default Value: 0.5]
@property AKParameter *resonance;

/// Set an optional resonance
/// @param resonance Amount of resonance. Self-oscillation occurs when this is approximately one. [Default Value: 0.5]
- (void)setOptionalResonance:(AKParameter *)resonance;



@end
