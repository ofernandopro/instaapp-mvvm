//
//  HomeViewModel.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 13/01/23.
//

import UIKit

class HomeViewModel {
    
    private var stories = [
        Story(image: "img1", userName: "Add Story"),
        Story(image: "img2", userName: "Jack"),
        Story(image: "img3", userName: "Carolina"),
        Story(image: "img4", userName: "Samuel"),
        Story(image: "img5", userName: "Ariana"),
        Story(image: "img6", userName: "puggy_101"),
        Story(image: "img7", userName: "fajn_d"),
    ]
    
    private var posts = [
        Post(profileImage: "img2", userName: "jack", postImage: "post1"),
        Post(profileImage: "img4", userName: "samuel", postImage: "post2"),
        Post(profileImage: "img3", userName: "carolina", postImage: "post3"),
        Post(profileImage: "img6", userName: "puggy_101", postImage: "post4"),
    ]
    
    public var getListStory: [Story] {
        stories
    }

    public var getListPosts: [Post] {
        posts
    }

    public var numberOfItems: Int {
        1
    }
    
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
    
}
