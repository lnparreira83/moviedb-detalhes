//
//  NetworkManager.swift
//  MovieDB - Detalhes
//
//  Created by Lucas Parreira on 8/06/21.
//

import Combine
import SwiftUI

class NetworkManager: ObservableObject {
    @Published var movies = Movie(id: 1, originalLanguage: "en_US", originalTitle: "Suicide-Squad", overview: "...", popularity: 9.7, posterPath: "...", releaseDate: "...", title: "Suicide-Squad", video: true, voteAverage: 9.9, voteCount: 99489)
    @Published var loading = false
    
    private let api_url_base = "https://api.themoviedb.org/3/movie/297761?api_key=2d8c23f5a34ffb9ae2fd788b1ee7bd43&language=en-US"
    
    init(){
        loading = true
    
        guard let url = URL(string: "\(api_url_base)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, error) in
            guard let data = data else { return print(url)}
            guard let result = try? JSONDecoder().decode(Movie.self, from: data) else { return print("Bunga - erro Decode") }
            DispatchQueue.main.async {
                self.movies = result
                self.loading = false
            }
        }.resume()
    }
}

class NetworkManagerSimilarMovie: ObservableObject {
    @Published var moviesSimilar = MovieListSimilar(page: 1,results: [],total_pages: 1,total_results: 10)
    
    private let api_url_movie_similar = "https://api.themoviedb.org/3/movie/297761/similar?api_key=2d8c23f5a34ffb9ae2fd788b1ee7bd43&language=en-US&page=1"
    
    init(){
    
        guard let url = URL(string: "\(api_url_movie_similar)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, error) in
            guard let data = data else { return print(url)}
            guard let result = try? JSONDecoder().decode(MovieListSimilar.self, from: data) else { return print("Bunga - erro Decode") }
            DispatchQueue.main.async {
                self.moviesSimilar = result
            }
        }.resume()
    }
}
