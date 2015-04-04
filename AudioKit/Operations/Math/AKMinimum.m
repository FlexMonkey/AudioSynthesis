//
//  AKMinimum.m
//  AudioKit
//
//  Created by Aurelius Prochazka on 12/22/12.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//
//  Implementation of Csound's min:
//  http://www.csounds.com/manual/html/min.html
//

#import "AKMinimum.h"

@implementation AKMinimum

- (NSString *)stringForCSD
{
    NSMutableArray *paramterStrings = [NSMutableArray array];
    
    for (AKParameter *param in self.inputs) {
        [paramterStrings addObject:[NSString stringWithFormat:@"AKAudio(%@)", param.parameterString]];
    }
    NSString *inputsCombined = [paramterStrings componentsJoinedByString:@", "];
    
    return [NSString stringWithFormat:@"%@ min %@",self, inputsCombined];
}

@end