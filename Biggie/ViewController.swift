//
//  ViewController.swift
//  Biggie
//
//  Created by nithish-pt6277 on 24/05/23.
//

import UIKit

class LogiViewnPage: UIViewController, UIScrollViewDelegate {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var avatarImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarHeight: CGFloat = 200
    private let avatarMinHeight: CGFloat = 50
    private var avatarHeightAnchor:NSLayoutConstraint?
    private var avatarWidthAnchor:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        scrollView.delegate = self
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(avatarImageView1)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
//            avatarImageView.bottomAnchor.constraint(lessThanOrEqualTo: view.centerYAnchor),
            
            avatarImageView1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImageView1.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            avatarImageView1.heightAnchor.constraint(equalToConstant: 1000),
            avatarImageView1.widthAnchor.constraint(equalToConstant: 1000),
            
        ])
        
        avatarHeightAnchor = avatarImageView.heightAnchor.constraint(equalToConstant: 200)
        avatarWidthAnchor = avatarImageView.widthAnchor.constraint(equalToConstant: 200)
        
        avatarWidthAnchor?.isActive = true
        avatarHeightAnchor?.isActive = true
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        
        avatarWidthAnchor?.isActive = false
        avatarHeightAnchor?.isActive = false
        if offsetY < 0 {
            
            let scaleFactor = (1 - (offsetY / avatarHeight))*2
            let height = max(avatarHeight * scaleFactor, avatarMinHeight)
            let width = height
            avatarHeightAnchor = avatarImageView.heightAnchor.constraint(equalToConstant: height)
            avatarWidthAnchor = avatarImageView.widthAnchor.constraint(equalToConstant: width)
        } else {
            let scaleFactor = (1 - (offsetY / avatarHeight))*2
            let height = max(avatarHeight * scaleFactor, avatarMinHeight)
            
            
            let width = height
            
            avatarHeightAnchor = avatarImageView.heightAnchor.constraint(equalToConstant: height)
            avatarWidthAnchor = avatarImageView.widthAnchor.constraint(equalToConstant: width)
        }
        avatarWidthAnchor?.isActive = true
        avatarHeightAnchor?.isActive = true
    }
}
