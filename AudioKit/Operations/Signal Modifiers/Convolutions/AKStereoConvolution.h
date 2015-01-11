//
//  AKConvolution.h
//  AudioKit
//
//  Auto-generated on 12/27/14.
//  Customized by Aurelius Prochazka on 12/27/14.
//
//  Copyright (c) 2014 Aurelius Prochazka. All rights reserved.
//

#import "AKStereoAudio.h"
#import "AKParameter+Operation.h"

/** Convolution based on a uniformly partitioned overlap-save algorithm.
 
 
 */

@interface AKStereoConvolution : AKStereoAudio
/// Instantiates the convolution with all values
/// @param input Input to the convolution, usually audio. [Default Value: ]
/// @param impulseResponseFilename File contain the impulse response audio.  Usually a very short impulse sound. [Default Value: ]
- (instancetype)initWithInput:(AKParameter *)input
      impulseResponseFilename:(NSString *)impulseResponseFilename;

/// Instantiates the convolution with default values
/// @param input Input to the convolution, usually audio.
/// @param impulseResponseFilename File contain the impulse response audio.  Usually a very short impulse sound.
+ (instancetype)convolutionWithInput:(AKParameter *)input
             impulseResponseFilename:(NSString *)impulseResponseFilename;



@end
