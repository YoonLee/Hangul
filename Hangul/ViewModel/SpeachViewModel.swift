//
//  SpeachViewModel.swift
//  Hangul
//
//  Created by Yoon, Lee on 7/14/22.
//

import Foundation

class SpeachViewModel: NSObject {
    private let kVowels = ["ㅏ", "ㅑ", "ㅓ", "ㅕ", "ㅗ", "ㅛ", "ㅜ", "ㅠ", "ㅡ", "ㅣ"]
    private let kConconants = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅌ", "ㅋ", "ㅍ", "ㅎ", "ㄲ", "ㄸ", "ㅃ", "ㅆ", "ㅉ"]
    private var composedAllElements = [[String]]()
    
    override init() {
        super.init()
        for vowel in kVowels {
            var composedElements = [String]()
            for conconant in kConconants {
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
            rows = kVowels.count
        case 1:
            rows = kConconants.count
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
    
    func getElement(_ segment: Int, _ at: IndexPath) -> String {
        let row = at.row
        let column = at.section
        let element: String
        
        switch segment {
        case 0:
            element = kVowels[row]
        case 1:
            element = kConconants[row]
        case 2:
            element = composedAllElements[column][row¡]
        default:
            element = ""
        }
        
        return element
    }
    
    func startSpeakInput(_ input: String) {
        PhonologyManager.shared.speachSynthesizer(input)
    }
}
