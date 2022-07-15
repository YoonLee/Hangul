//
//  PhonologyManager.swift
//  Hangul
//
//  Created by Yoon, Lee on 7/14/22.
//

import AVFoundation

class PhonologyManager: NSObject, AVSpeechSynthesizerDelegate {
    static let shared: PhonologyManager = {
        let instance = PhonologyManager()
        return instance
    }()
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {}
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("")
    }
    
    open func speachSynthesizer(_ input: String) {
        // utterance preparation
        let utterance = AVSpeechUtterance(string: input)
        let synthesizer = AVSpeechSynthesizer()
        guard let voice = AVSpeechSynthesisVoice(language: "ko") else { return }
        utterance.voice = voice
        utterance.rate = 0.25
        synthesizer.speak(utterance)
    }
}
