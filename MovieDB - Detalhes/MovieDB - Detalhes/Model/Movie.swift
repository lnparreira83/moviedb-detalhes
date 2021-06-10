//
//  Movie.swift
//  MovieDB - Detalhes
//
//  Created by Lucas Parreira on 8/06/21.
//

import Foundation

// MARK: - MovieDB
struct Movie: Codable, Identifiable {
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    var posterPath: String? 
    let releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    
    let BASEIMAGEURL = "https://image.tmdb.org/t/p/w500"
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
    }
}

struct MovieList: Codable {
    var results: [Movie]
}

// MARK: - MovieDBSimilar
struct MovieSimilar: Codable, Identifiable {
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    var posterPath: String?
    let releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let genre_ids: [Int]?
    
    
    let BASEIMAGEURL = "https://image.tmdb.org/t/p/w500"
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genre_ids
        
    }
}

struct MovieListSimilar: Codable {
    var page: Int?
    var results: [MovieSimilar]
    var total_pages: Int?
    var total_results: Int?
}

