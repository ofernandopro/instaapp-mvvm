//
//  HomeViewModel.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 13/01/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    
    private var service: HomeService = HomeService()
    private var stories = [Story]()
    private var posts = [Post]()
    
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public var getListStory: [Story] {
        stories
    }

    public var getListPosts: [Post] {
        posts
    }

    public var numberOfItems: Int {
        2
    }
    
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
    
    public func fetchAllRequest() {
        service.getHomeData { homeData, error in
            if error == nil {
                self.posts = homeData?.posts ?? []
                self.stories = homeData?.stories ?? []
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }
    
}
