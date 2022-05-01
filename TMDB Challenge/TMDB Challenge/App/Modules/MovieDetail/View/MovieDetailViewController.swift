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
    var movieId: Int = 0
    var popularity: Double = 0
    
    private var imagen: String? {
        didSet {
            guard let stringImage = imagen else { return }
            if let url = URL(string: "https://image.tmdb.org/t/p/w500/" + stringImage) {
                movieImage.load(url: url)
                
            }
        }
    }
    
    private var name: String? {
        didSet {
            movieName.text = name?.uppercased()
        }
    }
    
    
    private var originalLanguage: String? {
        didSet {
            movieOriginalLanguage.text = originalLanguage?.uppercased()
        }
    }
    
    private var releaseDate: String? {
        didSet {
            movieReleaseDate.text = releaseDate?.uppercased()
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
    
    private lazy var movieGenre: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 40)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    private lazy var movieOriginalLanguage: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 40)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    private lazy var moviePopularity: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 40)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    private lazy var movieReleaseDate: UILabel = {
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
        self.viewModel = MovieDetailViewModel(id: movieId, movieUrl: movieUrl, service: service, delegate: self)
        self.viewModel?.getMovie()
    }
    
    private func setupView(){
        view.addSubview(backgroudImage)
        view.addSubview(movieBackground)
        view.addSubview(movieImage)
        view.addSubview(movieName)
        view.addSubview(movieOriginalLanguage)
        view.addSubview(moviePopularity)
        view.addSubview(movieReleaseDate)

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
            movieImage.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 22),
            
            movieBackground.heightAnchor.constraint(equalToConstant: 200),
            movieBackground.widthAnchor.constraint(equalToConstant: 200),
            movieBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieBackground.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 60),

            
            movieOriginalLanguage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieOriginalLanguage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieOriginalLanguage.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 22),
            
            moviePopularity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            moviePopularity.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            moviePopularity.topAnchor.constraint(equalTo: movieOriginalLanguage.bottomAnchor, constant: 22),
            
            movieReleaseDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieReleaseDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieReleaseDate.topAnchor.constraint(equalTo: moviePopularity.bottomAnchor, constant: 22),
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
        originalLanguage = movie.originalLanguage
        popularity = movie.popularity
        releaseDate = movie.releaseDate
    }
    
    func showError() {
        print("Se rompio todo..")
    }
    
}
