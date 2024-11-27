//
//  FullImageViewController.swift
//  AlbumDemoApp
//
//  Created by Neel on 11/27/24.
//

import SDWebImage
import UIKit

class FullImageViewController: UIViewController {

    private let imageView = UIImageView()
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    var imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        setupImageView()
        activityIndicator.startAnimating()
        imageView.sd_setImage(with: URL(string: imageUrl)) { [weak self] _, _, _, _ in
            self?.activityIndicator.stopAnimating()
        }
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true

        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
