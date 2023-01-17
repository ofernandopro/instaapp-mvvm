//
//  HomeViewModelTests.swift
//  InstaAppMVVMTests
//
//  Created by Fernando Moreira on 16/01/23.
//

import XCTest
@testable import InstaAppMVVM

class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        sut = HomeViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGetListStory() {
        let stories = sut.getListStory
        XCTAssertEqual(stories.count, 7)
        XCTAssertEqual(stories[0].image, "img1")
        XCTAssertEqual(stories[1].userName, "Jack")
    }
    
    func testGetListPosts() {
        let posts = sut.getListPosts
        XCTAssertEqual(posts.count, 4)
        XCTAssertEqual(posts[0].profileImage, "img2")
        XCTAssertEqual(posts[1].userName, "samuel")
    }
    
    func testNumberOfItems() {
        let numberOfItems = sut.numberOfItems
        XCTAssertEqual(numberOfItems, 2)
    }
    
    func testSizeForItem() {
        let indexPath = IndexPath(row: 0, section: 0)
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let size = sut.sizeForItem(indexPath: indexPath, frame: frame)
        XCTAssertEqual(size, CGSize(width: 120, height: 200))
        
        let indexPath2 = IndexPath(row: 1, section: 0)
        let size2 = sut.sizeForItem(indexPath: indexPath2, frame: frame)
        XCTAssertEqual(size2, CGSize(width: 80, height: 200))
    }
}
