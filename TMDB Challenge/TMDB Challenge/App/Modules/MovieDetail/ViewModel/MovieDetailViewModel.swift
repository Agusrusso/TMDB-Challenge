//
//  MovieDetailViewModel.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import Foundation

class MovieDetailViewModel {

    private var delegate: MovieDetailDelegate
    private var service: MovieDetailService
    private var movieUrl: String
    
    init(movieUrl: String, service: MovieDetailService, delegate: MovieDetailDelegate) {
        self.movieUrl = movieUrl
        self.service = service
        self.delegate = delegate
    }
    
    func getMovie(){
        self.delegate.showLoading()
        service.getMovie(urlMovie: movieUrl) { movie in
            self.delegate.movieData(movie: movie)
            self.delegate.hideLoading()
        } onError: {
            self.delegate.hideLoading()
            self.delegate.showError()
        }

    }
}
