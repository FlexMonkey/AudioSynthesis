//
//  AKTableValue.m
//  AudioKit
//
//  Auto-generated on 2/27/15.
//  Customized by Aurelius Prochazka to have many more intializer options.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//
//  Implementation of Csound's table3:
//  http://www.csounds.com/manual/html/table3.html
//

#import "AKTableValue.h"
#import "AKManager.h"

@implementation AKTableValue
{
    AKTable * _table;
    AKParameter * _index;
    AKConstant *_useFractionalWidth;
}

- (instancetype)initWithTable:(AKTable *)table
                      atIndex:(AKParameter *)index
                   withOffset:(AKConstant *)offset
           usingWrappingIndex:(BOOL)useWrappingIndex
           useFractionalWidth:(BOOL)useFractionalWidth
{
    self = [super initWithString:[self operationName]];
    if (self) {
        _table = table;
        _index = index;
        _offset = offset;
        _useWrappingIndex = useWrappingIndex;
        _useFractionalWidth = akp(useFractionalWidth);
        [self setUpConnections];
    }
    return self;
}


- (instancetype)initWithTable:(AKTable *)table
                      atIndex:(AKParameter *)index
                   withOffset:(AKConstant *)offset
           usingWrappingIndex:(BOOL)useWrappingIndex
{
    return [self initWithTable:table
                       atIndex:index
                    withOffset:offset
            usingWrappingIndex:useWrappingIndex
            useFractionalWidth:NO];
}

- (instancetype)initWithTable:(AKTable *)table
       atFractionOfTotalWidth:(AKParameter *)fractionalIndex
                   withOffset:(AKConstant *)offset
           usingWrappingIndex:(BOOL)useWrappingIndex
{
    return [self initWithTable:table
                       atIndex:fractionalIndex
                    withOffset:offset
            usingWrappingIndex:useWrappingIndex
            useFractionalWidth:YES];
}

- (instancetype)initWithTable:(AKTable *)table
                      atIndex:(AKParameter *)index
{
    return [self initWithTable:table
                       atIndex:index
                    withOffset:akp(0)
            usingWrappingIndex:NO
            useFractionalWidth:NO];
}

- (instancetype)initWithTable:(AKTable *)table
       atFractionOfTotalWidth:(AKParameter *)fractionalIndex
{
    return [self initWithTable:table
                       atIndex:fractionalIndex
                    withOffset:akp(0)
            usingWrappingIndex:NO
            useFractionalWidth:YES];
}

+ (instancetype)valueOfTable:(AKTable *)table
                     atIndex:(AKParameter *)index
{
    return [[AKTableValue alloc] initWithTable:table
                                       atIndex:index];
}

+ (instancetype)valueOfTable:(AKTable *)table
      atFractionOfTotalWidth:(AKParameter *)fractionalIndex;
{
    return [[AKTableValue alloc] initWithTable:table
                        atFractionOfTotalWidth:fractionalIndex];
}

- (void)setOffset:(AKConstant *)offset {
    _offset = offset;
    [self setUpConnections];
}

- (void)setOptionalOffset:(AKConstant *)offset {
    [self setOffset:offset];
}


- (void)setUpConnections
{
    self.state = @"connectable";
    self.dependencies = @[_index, _offset];
}

- (NSString *)inlineStringForCSD
{
    NSMutableString *inlineCSDString = [[NSMutableString alloc] init];
    
    [inlineCSDString appendString:@"table3("];
    [inlineCSDString appendString:[self inputsString]];
    [inlineCSDString appendString:@")"];
    
    return inlineCSDString;
}


- (NSString *)stringForCSD
{
    NSMutableString *csdString = [[NSMutableString alloc] init];
    
    [csdString appendFormat:@"%@ table3 ", self];
    [csdString appendString:[self inputsString]];
    return csdString;
}

- (NSString *)inputsString {
    NSMutableString *inputsString = [[NSMutableString alloc] init];
    
    // Constant Values
    
    
    if ([_index class] == [AKAudio class]) {
        [inputsString appendFormat:@"%@, ", _index];
    } else {
        [inputsString appendFormat:@"AKAudio(%@), ", _index];
    }
    
    [inputsString appendFormat:@"%@, ", _table];
    
    [inputsString appendFormat:@"%@, ", _useFractionalWidth];
    
    [inputsString appendFormat:@"%@, ", _offset];
    
    [inputsString appendFormat:@"%d", _useWrappingIndex];
    return inputsString;
}

@end
