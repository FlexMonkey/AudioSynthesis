//
//  AKTableGenerator.m
//  AudioKit
//
//  Created by Aurelius Prochazka on 3/2/15.
//  Copyright (c) 2015 AudioKit. All rights reserved.
//

#import "AKTableGenerator.h"

@implementation AKTableGenerator

// Overwrite in subclass
- (int)generationRoutineNumber {
    return 0;
}

// Overwrite in subclass
- (NSArray *)parametersWithSize:(int)size {
    return @[];
}

@end
