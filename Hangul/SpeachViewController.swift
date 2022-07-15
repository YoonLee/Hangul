//
//  ViewController.swift
//  Hangul
//
//  Created by Yoon, Lee on 7/14/22.
//

import UIKit

class SpeachViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var combinedSegmentView: UISegmentedControl!
    
    private let viewModel = SpeachViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cellNib = UINib(nibName: LetterCollectionViewCell.name, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: LetterCollectionViewCell.reuseIdentifier)
        segmentChanged(segmentView)
    }

    @IBAction func segmentChanged(_ segmentView: UISegmentedControl) {
        combinedSegmentView.isHidden = self.segmentView.selectedSegmentIndex < 2
        collectionView.reloadData()
    }
}

extension SpeachViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getSelectedDataComponent(segmentView.selectedSegmentIndex, combinedSegmentView.selectedSegmentIndex).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCollectionViewCell.reuseIdentifier, for: indexPath) as! LetterCollectionViewCell
        let element = viewModel.getElement(segmentView.selectedSegmentIndex, detailSegmentIndex: combinedSegmentView.selectedSegmentIndex, at: indexPath.row)
        cell.titleLabel.text = element
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let element = viewModel.getElement(segmentView.selectedSegmentIndex, detailSegmentIndex: combinedSegmentView.selectedSegmentIndex, at: indexPath.row)
        viewModel.startSpeakInput(element)
    }
}

