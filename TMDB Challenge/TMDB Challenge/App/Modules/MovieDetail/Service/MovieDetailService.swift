//
//  MovieDetailService.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import Foundation

class MovieDetailService {

    func getMovie(urlMovie: String, onComplete: @escaping (MovieDetail) -> Void, onError: @escaping () -> Void) {

        ApiManager.shared.get(url: urlMovie) { response in

        switch response {
        case .success(let data):
           do {
               if let data = data {
                   let decoder = JSONDecoder()
                   decoder.keyDecodingStrategy = .convertFromSnakeCase
                   let movieDetail = try decoder.decode(MovieDetail.self, from: data)
                   onComplete(movieDetail)
               } else {
                   onError()
               }
           } catch {
               onError()
           }
        case .failure(_):
           onError()
        }
    }
 }
}
