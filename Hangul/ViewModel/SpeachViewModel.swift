//
//  SpeachViewModel.swift
//  Hangul
//
//  Created by Yoon, Lee on 7/14/22.
//

import Foundation

class SpeachViewModel: NSObject {
    let kVowels = ["ㅏ", "ㅑ", "ㅓ", "ㅕ", "ㅗ", "ㅛ", "ㅜ", "ㅠ", "ㅡ", "ㅣ"]
    let kConconants = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅌ", "ㅋ", "ㅍ", "ㅎ"]
    
    static let kExample1 = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "타", "카", "파", "하"]
    static let kExample2 = ["갸", "냐", "댜", "랴", "먀", "뱌", "샤", "야", "쟈", "챠", "탸", "캬", "퍄", "햐"]
    static let kExample3 = ["거", "너", "더", "러", "머", "버", "서", "어", "저", "처", "터", "커", "퍼", "허"]
    static let kExample4 = ["겨", "녀", "뎌", "려", "며", "벼", "셔", "여", "져", "쳐", "텨", "켜", "펴", "혀"]
    static let kExample5 = ["고", "노", "도", "로", "모", "보", "소", "오", "조", "초", "토", "코", "포", "호"]
    static let kExample6 = ["교", "뇨", "됴", "료", "묘", "뵤", "쇼", "요", "죠", "쵸", "툐", "쿄", "표", "효"]
    static let kExample7 = ["구", "누", "두", "루", "무", "부", "수", "우", "주", "추", "투", "쿠", "푸", "후"]
    static let kExample8 = ["규", "뉴", "듀", "류", "뮤", "뷰", "슈", "유", "쥬", "츄", "튜", "큐", "퓨", "휴"]
    static let kExample9 = ["그", "느", "드", "르", "므", "브", "스", "으", "즈", "츠", "트", "크", "프", "흐"]
    static let kExample10 = ["기", "니", "디", "리", "미", "비", "시", "이", "지", "치", "티", "키", "피", "히"]
    
    let kExamples = [kExample1, kExample2, kExample3, kExample4, kExample5, kExample6, kExample7, kExample8, kExample9, kExample10]
    
    func getSelectedDataComponent(_ mainSegmentIndex: Int, _ detailSegmentIndex: Int) -> [String] {
        let selectedComponent: [String]
        
        switch mainSegmentIndex {
        case 0:
            selectedComponent = kVowels
        case 1:
            selectedComponent = kConconants
        case 2:
            selectedComponent = getCombinedElementComponent(detailSegmentIndex)
        default:
            selectedComponent = []
        }
        
        return selectedComponent
    }
    
    func getCombinedElementsComponent(_ detailSegmentIndex: Int) -> [String] {
        getCombinedElementComponent(detailSegmentIndex)
    }
    
    func getCombinedElementComponent(_ combinedElementsIndex: Int) -> [String] {
        kExamples[combinedElementsIndex]
    }
    
    func getElement(_ mainSegmentIndex: Int, detailSegmentIndex: Int, at: Int) -> String {
        let component = getSelectedDataComponent(mainSegmentIndex, detailSegmentIndex)
        return component[at]
    }
    
    func startSpeakInput(_ input: String) {
        PhonologyManager.shared.speachSynthesizer(input)
    }
}
