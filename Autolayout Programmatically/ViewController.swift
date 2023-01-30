//
//  ViewController.swift
//  Autolayout Programmatically
//
//  Created by Jonathan Ricky Sandjaja on 30/01/23.
//

import UIKit

struct Videos {
    let title: String
    let image: UIImage
}

let videosArray = [
    Videos(title: "Kimi no na Wa - Official Trailer", image: UIImage(systemName: "play.rectangle.fill")!),
    Videos(title: "Kimi no na Wa - Official Trailer 2", image: UIImage(systemName: "play.rectangle.fill")!),
    Videos(title: "Kimi no na Wa - Official Trailer 3", image: UIImage(systemName: "play.rectangle.fill")!),
    Videos(title: "Kimi no na Wa - Sparkle", image: UIImage(systemName: "play.rectangle.fill")!),
    Videos(title: "Kimi no na Wa - Nandemonaiya", image: UIImage(systemName: "play.rectangle.fill")!),
]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "videoCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
    
    lazy var movieReleaseDate: UILabel = {
        let label = UILabel()
        label.text = "Release Date: 26/08/2016"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var movieRuntime: UILabel = {
        let label = UILabel()
        label.text = "Runtime: 106 minutes"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var movieGenre: UILabel = {
        let label = UILabel()
        label.text = "Genre: Romance, Animation, Drama"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var movieOverview: UILabel = {
        let label = UILabel()
        label.text = "High schoolers Mitsuha and Taki are complete strangers living separate lives. But one night, they suddenly switch places. Mitsuha wakes up in Taki’s body, and he in hers. This bizarre occurrence continues to happen randomly, and the two must adjust their lives around each other."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath)
        cell.textLabel?.text = videosArray[indexPath.row].title
        return cell
    }
    
    lazy var videosTitleText: UILabel = {
        let label = UILabel()
        label.text = "Videos"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupViews() {
        view.addSubview(movieTitle)
        view.addSubview(movieBackdrop)
        view.addSubview(movieReleaseDate)
        view.addSubview(movieRuntime)
        view.addSubview(movieGenre)
        view.addSubview(movieOverview)
        view.addSubview(videosTitleText)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            movieTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            movieTitle.topAnchor.constraint(equalTo: safeArea.topAnchor),
            
            movieBackdrop.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 16),
            movieBackdrop.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            movieBackdrop.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            movieBackdrop.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.28),
            
            movieReleaseDate.topAnchor.constraint(equalTo: movieBackdrop.bottomAnchor, constant: 16),
            movieReleaseDate.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            
            movieRuntime.topAnchor.constraint(equalTo: movieReleaseDate.bottomAnchor, constant: 5),
            movieRuntime.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            
            movieGenre.topAnchor.constraint(equalTo: movieRuntime.bottomAnchor, constant: 5),
            movieGenre.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            
            movieOverview.topAnchor.constraint(equalTo: movieGenre.bottomAnchor, constant: 10),
            movieOverview.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            movieOverview.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            videosTitleText.topAnchor.constraint(equalTo: movieOverview.bottomAnchor, constant: 16),
            videosTitleText.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: videosTitleText.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
        ])
    }
}

