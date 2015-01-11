//
//  SineWaveRenderer.swift
//  AudioSynthesis
//
//  Created by Simon Gladman on 14/10/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class SineWaveRenderer: UIControl
{
    let colorRef = CGColorGetComponents(UIColor.yellowColor().CGColor)
    let imageView: UIImageView = UIImageView(frame: CGRectZero)
    
    private let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
    private let bitmapInfo:CGBitmapInfo = CGBitmapInfo(CGImageAlphaInfo.PremultipliedFirst.rawValue)
    private var frequencyVelocityPairs = [FrequencyAmplitudePair]()
    
    private func imageFromARGB32Bitmap(pixels:[PixelData], width:UInt, height:UInt)->UIImage
    {
        let bitsPerComponent:UInt = 8
        let bitsPerPixel:UInt = 32
        
        var data = pixels // Copy to mutable []
        let providerRef = CGDataProviderCreateWithCFData(NSData(bytes: &data, length: data.count * sizeof(PixelData)))
        
        let cgim = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, width * UInt(sizeof(PixelData)), rgbColorSpace,	bitmapInfo, providerRef, nil, true, kCGRenderingIntentDefault)
        
        return UIImage(CGImage: cgim)!;
    }
    
    override func didMoveToSuperview()
    {
        addSubview(imageView)
        
        backgroundColor = UIColor.blackColor()
        layer.cornerRadius = 10
    }
    
    override func layoutSubviews()
    {
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    func setFrequencyAmplitudePairs(value: [FrequencyAmplitudePair])
    {
        self.frequencyVelocityPairs = value
        
        drawSineWave()
    }
    
    final func drawSineWave()
    {
        if frame == CGRectZero
        {
            return
        }
        
        var pixelArray = [PixelData](count: Int(frame.width * frame.height), repeatedValue: PixelData(a: 0, r:0, g: 0, b: 0));
        var previousCurveY:Double!
        
        for i in 1 ..< Int(frame.width)
        {
            let scale = M_PI * 5
            let curveX = Double(i)
            
            var curveY = Double(frame.height / 2)
            
            for pair in frequencyVelocityPairs
            {
                let frequency = Double(pair.frequency)
                let velocity = Double(pair.amplitude)
                
                curveY += ((sin(curveX / scale * frequency * 5)) * (velocity * 10))
            }
            
            if previousCurveY == nil
            {
                previousCurveY = curveY
            }
            
            // draw line from previous
            for yy in Int(min(previousCurveY, curveY)) ... Int(max(previousCurveY, curveY))
            {
                let pixelIndex : Int = (yy * Int(frame.width) + i);
                
                pixelArray[pixelIndex].r = UInt8(255 * colorRef[0]);
                pixelArray[pixelIndex].g = UInt8(255 * colorRef[1]);
                pixelArray[pixelIndex].b = UInt8(255 * colorRef[2]);
            }
            
            previousCurveY = curveY
        }
        
        let outputImage = imageFromARGB32Bitmap(pixelArray, width: UInt(frame.width), height: UInt(frame.height))
        
        imageView.image = outputImage;
    }
}

struct PixelData
{
    var a:UInt8 = 255
    var r:UInt8
    var g:UInt8
    var b:UInt8
}
