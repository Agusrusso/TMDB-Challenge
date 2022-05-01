//
//  MovieListViewController.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import UIKit

protocol MovieListDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
}


// VIEW: Contenedor del viewcontroller donde viven todos los controles visuales
class MovieListViewController: UIViewController {

    private var service = MovieListService()
    private var viewModel: MovieListViewModel?
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupView()
        setupConstraints()
        self.viewModel = MovieListViewModel(service: service, delegate: self)

        // Con delegates
        self.viewModel?.getMovies()
    }
    
    private func setupView(){
        // Agrego el tableview al viewcontroller
        view.addSubview(tableView)
        title = "Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: String(describing: MovieTableViewCell.self))
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension MovieListViewController: MovieListDelegate {
    
    func toogleLoading() {
        print("aca deberia estar cargando o NO")
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func showError() {
        print("Se rompio todo")
    }
    
}


extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = MovieDetailViewController()
        let movie = viewModel?.getMovie(at: indexPath.row)
        detailViewController.movieId = movie?.id ?? 0
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTableViewCell.self), for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = viewModel?.getMovie(at: indexPath.row)
        cell.name = movie?.title.uppercased()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getMovieCount() ?? 0
    }
    
}
