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
    let imageView: UIImageView = UIImageView(frame: CGRectZero)
    
    private var frequencyAplitudePairs = [FrequencyAmplitudePair]()
    
    var operation: SineWaveRendererOperation?
    let operationQueue = NSOperationQueue()
    var pendingOperation = false

    
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
    
    
    final func setFrequencyAmplitudePairs(value: [FrequencyAmplitudePair])
    {
        frequencyAplitudePairs = value
        
        if frame == CGRectZero
        {
            return
        }
        else if let _operation = operation
        {
            if _operation.executing
            {
                self.pendingOperation = true
                return
            }
        }
        
        operation = SineWaveRendererOperation(frequencyAplitudePairs: frequencyAplitudePairs, width: Int(frame.width), height: Int(frame.height))
        
        operation?.completionBlock = completionBlock
        
        operationQueue.addOperation(operation!)
    }
    
    final func completionBlock()
    {
        if let _operation = operation
        {
            dispatch_async(dispatch_get_main_queue(), {
                self.imageView.image = _operation.finalImage
                
                if self.pendingOperation
                {
                    self.pendingOperation = false;
                    self.setFrequencyAmplitudePairs(self.frequencyAplitudePairs)
                }
            })
        }
    }
    
}

class SineWaveRendererOperation: NSOperation
{
    private let colorRef = CGColorGetComponents(UIColor.yellowColor().CGColor)
    private let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
    private let bitmapInfo:CGBitmapInfo = CGBitmapInfo(CGImageAlphaInfo.PremultipliedFirst.rawValue)
    
    private var frequencyAplitudePairs: [FrequencyAmplitudePair]!
    private var width: Int!
    private var height: Int!
    
    var finalImage: UIImage?
    
    init (frequencyAplitudePairs: [FrequencyAmplitudePair], width: Int, height: Int)
    {
        self.frequencyAplitudePairs = frequencyAplitudePairs
        self.width = width
        self.height = height
    }
    
    override func main() -> ()
    {
        var pixelArray = [PixelData](count: width * height, repeatedValue: PixelData(a: 0, r:0, g: 0, b: 0));
        var previousCurveY:Double!
        
        for i in 1 ..< width
        {
            let scale = M_PI * 5
            let curveX = Double(i)
            
            var curveY = Double(height / 2)
            
            for pair in frequencyAplitudePairs
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
                let pixelIndex : Int = (yy * width + i);
                
                pixelArray[pixelIndex].r = UInt8(255 * colorRef[0]);
                pixelArray[pixelIndex].g = UInt8(255 * colorRef[1]);
                pixelArray[pixelIndex].b = UInt8(255 * colorRef[2]);
                
                let pixelIndex2 : Int = pixelIndex + 1
                if pixelIndex2 < pixelArray.count
                {
                    pixelArray[pixelIndex2].r = UInt8(255 * colorRef[0]);
                    pixelArray[pixelIndex2].g = UInt8(255 * colorRef[1]);
                    pixelArray[pixelIndex2].b = UInt8(255 * colorRef[2]);
                }
                
                let pixelIndex3 : Int = ((yy + 1) * width + i);
                if pixelIndex3 < pixelArray.count
                {
                    pixelArray[pixelIndex3].r = UInt8(255 * colorRef[0]);
                    pixelArray[pixelIndex3].g = UInt8(255 * colorRef[1]);
                    pixelArray[pixelIndex3].b = UInt8(255 * colorRef[2]);
                }
            }
            
            previousCurveY = curveY
        }
        
        finalImage = imageFromARGB32Bitmap(pixelArray, width: Int(width), height: Int(height))
    }
    
    private func imageFromARGB32Bitmap(pixels:[PixelData], width:Int, height:Int)->UIImage
    {
        let bitsPerComponent:Int = 8
        let bitsPerPixel:Int = 32
        
        var data = pixels // Copy to mutable []
        let providerRef = CGDataProviderCreateWithCFData(NSData(bytes: &data, length: data.count * sizeof(PixelData)))
        
    let cgim = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, width * Int(sizeof(PixelData)), rgbColorSpace,	bitmapInfo, providerRef, nil, true, kCGRenderingIntentDefault)
        
        
        return UIImage(CGImage: cgim)!;
    }
    
}

struct PixelData
{
    var a:UInt8 = 255
    var r:UInt8
    var g:UInt8
    var b:UInt8
}
