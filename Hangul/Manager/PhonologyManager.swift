//
//  PhonologyManager.swift
//  Hangul
//
//  Created by Yoon, Lee on 7/14/22.
//

import AVFoundation

class PhonologyManager: NSObject {
    private let synthesizer = AVSpeechSynthesizer()
    private var speechDidStartCallback: ((AVSpeechSynthesizer, AVSpeechUtterance, Int) -> Void)?
    private var speechDidFinishCallback: ((AVSpeechSynthesizer, AVSpeechUtterance) -> Void)?
    
    static let shared: PhonologyManager = {
        let instance = PhonologyManager()
        instance.synthesizer.delegate = instance
        return instance
    }()
    
    func speechOut(_ input: String) {
        let utterance = AVSpeechUtterance(string: input)
        guard let voice = AVSpeechSynthesisVoice(language: "ko") else { return }
        utterance.voice = voice
        utterance.rate = 0.25
        synthesizer.speak(utterance)
    }
    
    func speechOut(_ input: String, _ didFinish: @escaping ((AVSpeechSynthesizer, AVSpeechUtterance) -> Void)) {
        speechOut(input)
        speechDidFinishCallback = { synthesizer, utterance in
            didFinish(synthesizer, utterance)
        }
    }
    
    func speechOut(_ inputs: [String], _ didStart: @escaping ((AVSpeechSynthesizer, AVSpeechUtterance, Int) -> Void)) {
        let operationQueue = OperationQueue.main
        operationQueue.name = "PhonologyQueue"
        
        for (index, input) in inputs.enumerated() {
            let operation = SpeechOperation(input)
            operation.queuePriority = .normal
            operation.qualityOfService = .background
            operationQueue.addOperation {
                operation
            }
        }
    }
}

extension PhonologyManager: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print(".started \(utterance.speechString)")
        speechDidStartCallback?(synthesizer, utterance, 0)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print(".finished \(utterance.speechString)")
        speechDidFinishCallback?(synthesizer, utterance)
    }
}
