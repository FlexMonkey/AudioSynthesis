//
//  ViewController.swift
//  AudioSynthesis
//
//  Created by Simon Gladman on 14/10/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var toneWidgets = [ToneWidget]()
    var sineWaveRenderer = SineWaveRenderer()

    var soundGenerator = SoundGenerator()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(sineWaveRenderer)
        
        soundGenerator.setUp()
   
        for i in 0 ..< Constants.numInstruments
        {
            let toneWidget = ToneWidget(channelNumber: i, frame: CGRectZero)
            
            toneWidget.addTarget(self, action: "toneWidgetChangeHandler:", forControlEvents: UIControlEvents.ValueChanged)
            
            toneWidgets.append(toneWidget)
            view.addSubview(toneWidget)
            
            soundGenerator.playNoteOn(toneWidget.getFrequencyAmplitudePair(), channelNumber: i)
        }
    }

    func toneWidgetChangeHandler(toneWidget : ToneWidget)
    {
        updateSineWave()
  
        soundGenerator.playNoteOn(toneWidget.getFrequencyAmplitudePair(), channelNumber: toneWidget.getChannelNumber())
    }


    func updateSineWave()
    {
        var values = [FrequencyAmplitudePair]()
        
        for widget in toneWidgets
        {
            values.append(widget.getFrequencyAmplitudePair())
        }
        
        sineWaveRenderer.setFrequencyAmplitudePairs(values)
    }
    
    override func viewDidLayoutSubviews()
    {
        let sineWaveRendererWidth = Int(view.frame.width - 40)
        
        sineWaveRenderer.frame = CGRect(x: Int(view.frame.width / 2) - sineWaveRendererWidth / 2, y: Int(topLayoutGuide.length), width: sineWaveRendererWidth, height: 125)
        
        let columWidth = view.frame.width / 4
        let targetY = view.frame.height - 625 + topLayoutGuide.length
        
        for (i: Int, toneWidget: ToneWidget) in enumerate(toneWidgets)
        {
            let targetX = CGFloat(i) * columWidth + (columWidth / 2) - CGFloat(Constants.width / 2)
            
            toneWidget.frame = CGRect(x: targetX, y: targetY, width: CGFloat(Constants.width), height: 625)
        }
        
        updateSineWave()
    }
    
    override func supportedInterfaceOrientations() -> Int
    {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }

}

struct Constants
{
    static let width = 220
    static let numInstruments = 4
    static let frequencyScale: Float = 1760.0
}

