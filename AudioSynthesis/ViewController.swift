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
    var currentNotes = [FrequencyVelocityPair]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(sineWaveRenderer)
   
        for i in 0 ... 3
        {
            let toneWidget = ToneWidget(index: i, frame: CGRectZero)
            
            toneWidget.addTarget(self, action: "toneWidgetChangeHandler:", forControlEvents: UIControlEvents.ValueChanged)
            
            toneWidgets.append(toneWidget)
            view.addSubview(toneWidget)
            
            currentNotes.append(toneWidget.getFrequencyVelocityPair())
            
            soundGenerator.playNoteOn(UInt32(toneWidget.getFrequencyVelocityPair().frequency), velocity: UInt32(toneWidget.getFrequencyVelocityPair().velocity), channelNumber: UInt32(toneWidget.getIndex()))
        }
    }

    func toneWidgetChangeHandler(toneWidget : ToneWidget)
    {
        soundGenerator.playNoteOff(UInt32(currentNotes[toneWidget.getIndex()].frequency), channelNumber: UInt32(toneWidget.getIndex()))
        
        updateSineWave()
        
        soundGenerator.playNoteOn(UInt32(toneWidget.getFrequencyVelocityPair().frequency), velocity: UInt32(toneWidget.getFrequencyVelocityPair().velocity), channelNumber: UInt32(toneWidget.getIndex()))
        
        currentNotes[toneWidget.getIndex()] = toneWidget.getFrequencyVelocityPair()
    }
    
    /*
@IBAction func playNoteOn(b:UIButton) {
var note:UInt32 = UInt32(b.tag)
var velocity:UInt32 = 25
soundGenerator.playNoteOn(note, velocity: velocity)
}

@IBAction func playNoteOff(b:UIButton) {
var note:UInt32 = UInt32(b.tag)
soundGenerator.playNoteOff(note)
*/

    func updateSineWave()
    {
        var values = [FrequencyVelocityPair]()
        
        for widget in toneWidgets
        {
            values.append(widget.getFrequencyVelocityPair())
            
  
        }
        
        sineWaveRenderer.setFrequencyVelocityPairs(values)
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
        return Int(UIInterfaceOrientationMask.Landscape.toRaw())
    }

}

struct Constants
{
    static let width = 220
}

