//
//  StoryCardViewModel.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 13/01/23.
//

import UIKit

class StoryCardViewModel {

    private var listStory: [Story]
    
    init(listStory: [Story]) {
        self.listStory = listStory
    }
    
    public var numberOfItems: Int {
        listStory.count
    }
    
    func loadCurrentStory(indexPath: IndexPath) -> Story {
        listStory[indexPath.row]
    }
    
}
