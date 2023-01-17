//
//  HomeScreenTests.swift
//  InstaAppMVVMUITests
//
//  Created by Fernando Moreira on 14/01/23.
//
/*
import XCTest
@testable import InstaAppMVVM

class HomeScreenUITests: XCTestCase {
    
    var sut: HomeScreen!
    var collectionView: UICollectionView!
    
    override func setUp() {
        super.setUp()
        sut = HomeScreen(frame: .zero)
        collectionView = sut.collectionView
    }
    
    override func tearDown() {
        sut = nil
        collectionView = nil
        super.tearDown()
    }
    
    func test_collectionView_is_not_nil() {
        XCTAssertNotNil(collectionView)
    }
    
    func test_collectionView_shows_horizontal_scroll_indicator() {
        XCTAssertFalse(collectionView.showsHorizontalScrollIndicator)
    }
    
    func test_collectionView_background_color() {
        XCTAssertEqual(collectionView.backgroundColor, .clear)
    }
    
    func test_collectionView_flowLayout_scrollDirection() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            XCTFail("CollectionView layout is not UICollectionViewFlowLayout")
            return
        }
        XCTAssertEqual(layout.scrollDirection, .horizontal)
    }
    
    func test_collectionView_has_correct_cell_reuse_identifiers() {
        XCTAssertEqual(StoryCardCollectionViewCell.identifier, "StoryCardCollectionViewCell")
        XCTAssertEqual(PostCardCollectionViewCell.identifier, "PostCardCollectionViewCell")
    }
    
//    func test_configProtocolsCollectionView() {
//        let delegate = UICollectionViewDelegateMock()
//        let dataSource = UICollectionViewDataSourceMock()
//        sut.configProtocolsCollectionView(delegate: delegate, dataSource: dataSource)
//        XCTAssertTrue(collectionView.delegate === delegate)
//        XCTAssertTrue(collectionView.dataSource === dataSource)
//    }
}
*/
//class UICollectionViewDelegateMock: NSObject, UICollectionViewDelegate { }
//class UICollectionViewDataSourceMock: NSObject, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 0 }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { return UICollectionViewCell() }
//}
