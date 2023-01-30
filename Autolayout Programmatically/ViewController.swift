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
    
    var movieTitle: UILabel = {
        let title = UILabel()
        title.text = "Kimi no na Wa"
        title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    func setupViews() {
        view.addSubview(movieTitle)
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            movieTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            movieTitle.topAnchor.constraint(equalTo: safeArea.topAnchor),
        ])
    }
}

