//
//  MovieTableCellViewModel.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import Foundation

class MovieTableCellViewModel {
    var id: Int
    var name: String
    var nameSerch: String
    var date: String
    var genreIDS : [Int] = []
    var score: String
    var image: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.name = movie.name ?? movie.title ?? ""
        self.nameSerch =  movie.name ?? movie.title ?? ""
        self.genreIDS = movie.genreIDS
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.score = "\(movie.voteAverage)/10"
        self.image = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}
