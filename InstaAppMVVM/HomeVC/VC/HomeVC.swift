//
//  ViewController.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 13/01/23.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {

    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    
//    let logOutBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(onSearchButtonClicked))
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "InstaApp"
//        self.navigationItem.rightBarButtonItem  = logOutBarButtonItem
        //self.navigationItem.rightBarButtonItem  = self.homeScreen?.logOutBarButtonItem
        viewModel.delegate(delegate: self)
        viewModel.fetchAllRequest()
    }
    
//    @objc func onSearchButtonClicked(){
//        print(#function)
//        do {
//            try Auth.auth().signOut()
//            let loginVC = LoginVC()
//            loginVC.modalPresentationStyle = .fullScreen
//            present(loginVC, animated: true)
//        } catch {
//
//        }
//    }

}

extension HomeVC: HomeViewModelProtocol {
    
    func success() {
        DispatchQueue.main.async {
            self.homeScreen?.configProtocolsCollectionView(delegate: self, dataSource: self)
        }
    }
    
    func error() {
        print(#function)
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath) as? StoryCardCollectionViewCell
            cell?.setupCell(listStory: viewModel.getListStory)
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            cell?.setupCell(listPosts: viewModel.getListPosts)
            return cell ?? UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
    }
    
}

