//
//  GenreMovieMode.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import Foundation

import Foundation

// MARK: - Welcome
struct GenreMovieModel: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
