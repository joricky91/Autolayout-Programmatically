//
//  ViewController.swift
//  Autolayout Programmatically
//
//  Created by Jonathan Ricky Sandjaja on 30/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    lazy var movieTitle: UILabel = {
        let title = UILabel()
        title.text = "Kimi no na Wa"
        title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var movieBackdrop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "kimi_no_na_wa")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    func setupViews() {
        view.addSubview(movieTitle)
        view.addSubview(movieBackdrop)
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            movieTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            movieTitle.topAnchor.constraint(equalTo: safeArea.topAnchor),
            
            movieBackdrop.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 16),
            movieBackdrop.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            movieBackdrop.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            movieBackdrop.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.28)
        ])
    }
}

