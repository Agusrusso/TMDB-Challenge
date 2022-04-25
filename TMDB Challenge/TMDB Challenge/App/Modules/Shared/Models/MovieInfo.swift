//
//  MovieInfo.swift
//  TMDB Challenge
//
//  Created by Agustin Russo on 25/04/2022.
//

import Foundation


// MARK: - Welcome
struct Welcome: Codable {
    let id: Int
    let name, overview: String
    let posterPath: JSONNull?
    let backdropPath: String
    let parts: [MovieDetail]

    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case parts
    }
}

// MARK: - Part
struct MovieDetail: Codable {
    let adult: Bool
    let backdropPath: JSONNull?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview, releaseDate: String
    let posterPath: String
    let popularity: Double
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case popularity, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
