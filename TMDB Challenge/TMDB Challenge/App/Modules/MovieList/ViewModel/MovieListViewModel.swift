//
//  MovieViewModel.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import Foundation

class MovieListViewModel {
    
    private var service: MovieListService
    private var delegate: MovieListDelegate
    private var movies =  [Movie]()
    
    init (service: MovieListService, delegate: MovieListDelegate) {
        self.service = service
        self.delegate = delegate
    }
    

    // Con delegates
    func getMovies() {
        self.delegate.toogleLoading()
        service.getMovies { movies in
            self.movies = movies
            

            self.delegate.reloadTable()
            self.delegate.toogleLoading()
        } onError: {

            self.delegate.showError()
            self.delegate.toogleLoading()
        }
    }
    
    func getMovie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func getMovieCount () -> Int {
        return movies.count
    }

}
