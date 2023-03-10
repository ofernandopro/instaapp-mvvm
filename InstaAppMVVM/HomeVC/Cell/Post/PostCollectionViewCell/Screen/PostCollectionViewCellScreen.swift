//
//  PostCollectionViewCellScreen.swift
//  InstaAppMVVM
//
//  Created by Fernando Moreira on 14/01/23.
//

import UIKit
import SnapKit

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
        img.isHidden = true
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
        img.isHidden = true
        return img
    }()
    
    @objc func tappedLikeImageView() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
            self.likeImageView.center.y += 50
        } completion: { finished in
            self.likeImageView.center.y -= 50
            self.likeImageView.isHidden = true
        }
    }
    
    @objc func tappedPostImageView() {
        heartImageView.isHidden = false
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn) {
            self.heartImageView.transform = .init(scaleX: 1.8, y: 1.8)
            self.postImageView.transform = .init(scaleX: 1.05, y: 1.05)
            self.likeImageView.center.y += 50
        } completion: { finished in
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn) {
                self.postImageView.transform = .identity
                self.likeImageView.center.y -= 50
                self.likeImageView.isHidden = false
            }
            self.heartImageView.transform = .identity
            self.heartImageView.isHidden = true
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        cardView.addSubview(profileImageView)
        cardView.addSubview(userNameLabel)
        cardView.addSubview(likeImageView)
        cardView.addSubview(postImageView)
        cardView.addSubview(heartImageView)
        configConstraintsSnapKit()
        //configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraintsSnapKit() {
        configCardViewConstraints()
        configLikeImageViewConstraints()
        configProfileImageViewConstraints()
        configUserNameLabelConstraints()
        configPostImageViewConstraints()
        configHeartImageViewConstraints()
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
    
    private func configCardViewConstraints() {
        cardView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func configLikeImageViewConstraints() {
        likeImageView.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.top).offset(19)
            make.trailing.equalTo(cardView.snp.trailing).inset(20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
    }
    
    private func configProfileImageViewConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.top).offset(17)
            make.leading.equalTo(cardView.snp.leading).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    private func configUserNameLabelConstraints() {
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.top).offset(24)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.trailing.equalTo(likeImageView.snp.leading).inset(5)
        }
    }

    private func configPostImageViewConstraints() {
        postImageView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(17)
            make.leading.equalTo(cardView.snp.leading).offset(7)
            make.trailing.equalTo(cardView.snp.trailing).inset(7)
            make.bottom.equalTo(cardView.snp.bottom).inset(7)
        }
    }
    
    private func configHeartImageViewConstraints() {
        heartImageView.snp.makeConstraints { make in
            make.centerX.equalTo(postImageView.snp.centerX)
            make.centerY.equalTo(postImageView.snp.centerY)
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
    }
    
}
