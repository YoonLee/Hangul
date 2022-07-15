//
//  LetterCollectionViewCell.swift
//  Hangul
//
//  Created by Yoon, Lee on 7/14/22.
//

import UIKit
import SwiftUI

class LetterCollectionViewCell: UICollectionViewCell {
    static let name = "LetterCollectionViewCell"
    static let reuseIdentifier = "kCollectionItemID"
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.borderWidth = 1
        layer.cornerRadius = 2.5
        layer.masksToBounds = true
        
        let selectedBackgroundView = UIView(frame: bounds)
        selectedBackgroundView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.selectedBackgroundView = selectedBackgroundView
    }
}
