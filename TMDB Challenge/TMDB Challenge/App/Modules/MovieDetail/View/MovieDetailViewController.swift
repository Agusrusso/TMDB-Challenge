//
//  MovieDetailViewController.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import UIKit

protocol MovieDetailDelegate {
    func showLoading()
    func hideLoading()
    func movieData(movie: MovieDetail)
    func showError()
}

class MovieDetailViewController: UIViewController {

    var movieUrl: String = ""
    
    private var imagen: String? {
        didSet {
            if let url = URL(string: imagen ?? "") {
                movieImage.load(url: url)
            }
        }
    }
    
    private var name: String? {
        didSet {
            movieName.text = name?.uppercased()
        }
    }
    
    private var service = MovieDetailService()
    private var viewModel:MovieDetailViewModel?

    private lazy var movieBackground: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.layer.cornerRadius = 70
        aView.backgroundColor = .white.withAlphaComponent(0.4)
        return aView
    }()
    
    private lazy var backgroudImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.image = UIImage(named: "background")
        aImage.contentMode = .scaleAspectFill
        return aImage
    }()
    
    private lazy var movieImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        return aImage
    }()
    
    private lazy var movieName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 40)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = MovieDetailViewModel(movieUrl: movieUrl, service: service, delegate: self)
        self.viewModel?.getMovie()
    }
    
    private func setupView(){
        view.addSubview(backgroudImage)
        view.addSubview(movieBackground)
        view.addSubview(movieImage)
        view.addSubview(movieName)

    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            backgroudImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroudImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroudImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroudImage.topAnchor.constraint(equalTo: view.topAnchor),
            
            movieImage.heightAnchor.constraint(equalToConstant: 200),
            movieImage.widthAnchor.constraint(equalToConstant: 200),
            movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 22),
            
            movieBackground.heightAnchor.constraint(equalToConstant: 200),
            movieBackground.widthAnchor.constraint(equalToConstant: 200),
            movieBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
        ])
    }

}


extension MovieDetailViewController: MovieDetailDelegate {
    
    func showLoading() {

        
    }
    
    func hideLoading() {

    }
    
    func movieData(movie: MovieDetail) {
        name = movie.title
        imagen = movie.posterPath
    }
    
    func showError() {
        print("Se rompio todo..")
    }
    
}
