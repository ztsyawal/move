//
//  DetailsMovieViewModel.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import Foundation

class DetailsMovieViewModel {
    
    var movieData: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieId: Int
    var movieGenreIDS: [Int]
    var score: Double
    
    init(movie: Movie) {
        self.movieData = movie
        self.score = movie.voteAverage
        self.movieId = movie.id
        self.movieGenreIDS = movie.genreIDS
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeImageURL(movie.posterPath ?? "")
       
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
    
}
