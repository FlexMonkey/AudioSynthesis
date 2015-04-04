//
//  AKInverse.h
//  AudioKit
//
//  Created by Aurelius Prochazka on 2/21/15.
//  Copyright (c) 2015 AudioKit. All rights reserved.
//

#import "AKParameter+Operation.h"

@interface AKInverse : AKParameter

- (instancetype)initWIthInput:(AKParameter *)input;

@end
