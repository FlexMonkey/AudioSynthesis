//
//  SoundGenerator.swift
//
//  Simon Gladman Jan 2015
//
//  Uses http://audiokit.io/


class SoundGenerator : NSObject
{
    var oscillators = [Synth]()
    
    final func setUp()
    {
        for i in 0 ..< Constants.numInstruments
        {
            let synth = Synth()
            AKOrchestra.addInstrument(synth)
            
            oscillators.append(synth)
        }

        AKOrchestra.start()

        for oscillator in oscillators
        {
            oscillator.play()
        }
    }
    
    final func playNoteOn(value: FrequencyAmplitudePair, channelNumber: Int)
    {
        let scaledFrequency = 0 + (value.frequency * Constants.frequencyScale)

        oscillators[channelNumber].amplitude.setValue(value.amplitude / 4.0, forKey: "value")
        
        oscillators[channelNumber].frequency.setValue(scaledFrequency, forKey: "value")
    }
    
}


class Synth: AKInstrument
{
 
    var frequency = AKInstrumentProperty(value: 0,  minimum: 0, maximum: Constants.frequencyScale)
    var amplitude = AKInstrumentProperty(value: 0,  minimum: 0, maximum: 0.25)
    
    override init()
    {
        super.init()
        
        addProperty(frequency)
        addProperty(amplitude)
        
        let oscillator = AKOscillator()
        
        oscillator.frequency = frequency
        oscillator.amplitude = amplitude
        
        connect(oscillator)
        connect(AKAudioOutput(audioSource: oscillator))
    }
}

