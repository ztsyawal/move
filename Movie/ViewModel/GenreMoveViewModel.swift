//
//  GenreMoveViewModel.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import Foundation
class GenreMoveViewModel {
    
    var genreData: Genre
    
    
    var genreId: Int
    var genreName: String
    
    init(genre: Genre) {
        self.genreData = genre
        self.genreName = genre.name
        self.genreId = genre.id
        
        
    }
}
