//
//  SpeechOperation.swift
//  Hangul
//
//  Created by Yoon Lee on 7/29/22.
//

import Foundation

class SpeechOperation: BlockOperation {
    private let input: String
    
    init(_ input: String) {
        self.input = input
        super.init()
        name = "SpeechOperation - \(self.input)"
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        PhonologyManager.shared.speechOut(self.input) { (synthesizer, utterance) in
            print(".dequeue - \(utterance.speechString)")
        }
    }
}
