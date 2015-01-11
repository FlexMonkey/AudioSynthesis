//
//  AKSoundFile.h
//  AudioKit
//
//  Created by Aurelius Prochazka on 6/16/12.
//  Copyright (c) 2012 Aurelius Prochazka. All rights reserved.
//

#import "AKFunctionTable.h"

/** Transfers data from a soundfile into a function table.

 File types supported are given here: http://www.mega-nerd.com/libsndfile/
*/

@interface AKSoundFile : AKFunctionTable

/// Store file with a filename
/// @param filename Audio file to load.  Most types are supported.
- (instancetype)initWithFilename:(NSString *)filename;

/// Returns the string to retrieve the number of channels of a sound file table
- (AKConstant *)channels;

@end


