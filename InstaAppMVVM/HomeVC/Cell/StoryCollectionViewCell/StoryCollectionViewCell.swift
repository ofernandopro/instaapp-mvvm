//
//  StoryCollectionViewCell.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 13/01/23.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"
    
    //private var screen: StoryCardCollectionViewCellScreen = StoryCardCollectionViewCellScreen()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        configScreen()
//        screen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
