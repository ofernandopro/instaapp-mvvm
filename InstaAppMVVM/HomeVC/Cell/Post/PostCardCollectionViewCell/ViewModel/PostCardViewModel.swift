//
//  PostCardViewModel.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 14/01/23.
//

import UIKit

class PostCardViewModel {

    private var listPosts: [Post]
    
    init(listPosts: [Post]) {
        self.listPosts = listPosts
    }
    
    public var numberOfItems: Int {
        listPosts.count
    }
    
    func loadCurrentStory(indexPath: IndexPath) -> Post {
        listPosts[indexPath.row]
    }
    
}
