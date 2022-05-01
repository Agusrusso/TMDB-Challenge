//
//  MovieInfo.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import Foundation


// MARK: - Part
struct MovieDetail: Codable {
    let backdropPath: String?
    let id: Int
    let originalLanguage, releaseDate: String
    let posterPath: String?
    let popularity: Double
    let title: String

}

