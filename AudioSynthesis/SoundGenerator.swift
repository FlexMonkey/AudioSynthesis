//
//  SoundGenerator.swift
//
//  Simon Gladman Jan 2015
//
//  Uses http://audiokit.io/


class SoundGenerator : NSObject
{
    var oscillators = [FMSynth]()
    
    func setUp()
    {
        for i in 0 ..< Constants.numInstruments
        {
            let fmOscillator = FMSynth()
            AKOrchestra.addInstrument(fmOscillator)
            
            oscillators.append(fmOscillator)
        }

        AKOrchestra.start()

        for fmOscillator in oscillators
        {
            fmOscillator.play()
        }
    }
    
    func playNoteOn(value: FrequencyAmplitudePair, channelNumber: Int)
    {
        let scaledFrequency = 0 + (value.frequency * Constants.frequencyScale)

        oscillators[channelNumber].amplitude.setValue(value.amplitude / 2.0, forKey: "value")
        
        oscillators[channelNumber].frequency.setValue(scaledFrequency, forKey: "value")
    }
    
}


class FMSynth: AKInstrument
{
 
    var frequency = AKInstrumentProperty(value: 0,  minimum: 0, maximum: Constants.frequencyScale)
    var amplitude = AKInstrumentProperty(value: 0, minimum: 0,   maximum: 0.5)
    
    override init()
    {
        super.init()
        
        addProperty(frequency)
        addProperty(amplitude)
        
        let fmOscillator = AKFMOscillator()
        
        fmOscillator.baseFrequency = frequency
        fmOscillator.amplitude = amplitude
        
        connect(fmOscillator)
        connect(AKAudioOutput(audioSource: fmOscillator))
    }
}
