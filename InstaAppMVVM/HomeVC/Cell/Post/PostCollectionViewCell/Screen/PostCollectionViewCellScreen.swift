//
//  PostCollectionViewCellScreen.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 14/01/23.
//

import UIKit

class PostCollectionViewCellScreen: UIView {

    lazy var cardView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.setCardShadow()
        view.clipsToBounds = true
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "demo")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        return img
    }()
    
    lazy var userNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name user"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var likeImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "red-heart")
        img.contentMode = .scaleAspectFill
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLikeImageView))
        tap.numberOfTapsRequired = 1
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        img.isHidden = false
        return img
    }()
    
    lazy var postImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedPostImageView))
        tap.numberOfTapsRequired = 2
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    lazy var heartImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "white-heart")
        img.contentMode = .scaleAspectFill
        img.isHidden = false
        return img
    }()
    
    @objc func tappedLikeImageView() {
        
    }
    
    @objc func tappedPostImageView() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        cardView.addSubview(profileImageView)
        cardView.addSubview(userNameLabel)
        cardView.addSubview(likeImageView)
        cardView.addSubview(postImageView)
        cardView.addSubview(heartImageView)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

            likeImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 19),
            likeImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            likeImageView.heightAnchor.constraint(equalToConstant: 25),
            likeImageView.widthAnchor.constraint(equalToConstant: 25),
            
            profileImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 17),
            profileImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            
            userNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: likeImageView.leadingAnchor, constant: -5),
            
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 17),
            postImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -7),
            postImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 7),
            postImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -7),
            
            heartImageView.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor),
            heartImageView.heightAnchor.constraint(equalToConstant: 70),
            heartImageView.widthAnchor.constraint(equalToConstant: 70),
            
        ])
    }

}
