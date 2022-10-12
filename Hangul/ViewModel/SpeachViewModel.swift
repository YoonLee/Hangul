//
//  SpeachViewModel.swift
//  Hangul
//
//  Created by Yoon, Lee on 7/14/22.
//

import Foundation

class SpeachViewModel: NSObject {
    private let vowels = ["ㅏ", "ㅑ", "ㅓ", "ㅕ", "ㅗ", "ㅛ", "ㅜ", "ㅠ", "ㅡ", "ㅣ"]
    private let conconants = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅌ", "ㅋ", "ㅍ", "ㅎ", "ㄲ", "ㄸ", "ㅃ", "ㅆ", "ㅉ"]
    private var composedAllElements = [[String]]()
    
    override init() {
        super.init()
        for vowel in vowels {
            var composedElements = [String]()
            for conconant in conconants {
                let composeElement = getComposedString(vowel, conconant)
                composedElements.append(composeElement)
             }
            
            composedAllElements.append(composedElements)
        }
    }
    
    func getNumberOfSections(_ segment: Int) -> Int {
        return 1
    }
    
    func getNumberOfRows(_ segment: Int, _ section: Int) -> Int {
        let rows: Int
        
        switch segment {
        case 0:
            rows = vowels.count
        case 1:
            rows = conconants.count
        case 2:
            rows = composedAllElements[section].count
        default:
            rows = 0
        }
        
        return rows
    }
    
    func getComposedString(_ vowel: String, _ conconant: String) -> String {
        (conconant + vowel).precomposedStringWithCompatibilityMapping
    }
    
    func getElement(_ segment: Int, _ segment2: Int, _ at: IndexPath) -> String {
        let row = at.row
        let element: String
        
        switch segment {
        case 0:
            element = vowels[row]
        case 1:
            element = conconants[row]
        case 2:
            element = composedAllElements[segment2][row]
        default:
            element = ""
        }
        
        return element
    }
    
    func startSpeakInput(_ input: String) {
        PhonologyManager.shared.speechOut(input)
    }
    
    func playAll(_ segment: Int, _ segment2: Int) {
        let component: [String]
        
        switch segment {
        case 0:
            component = vowels
        case 1:
            component = conconants
        case 2:
            component = composedAllElements[segment2]
        default:
            component = [""]
        }
        
        PhonologyManager.shared.speechOut(component) { synthesizer, utter, played in
            
        }
    }
}
