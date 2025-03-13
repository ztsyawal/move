//
//  MainViewModel.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import Foundation

class MainViewModel {
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: TrendingMovieModel?
    var dataSourceGenre: GenreMovieModel?
    var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var genres: Observable<[GenreMoveViewModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let trendingMovieData):
                self?.dataSource = trendingMovieData
                self?.mapMovieData()
            case .failure(let err):
                print(err)
            }
        }
    }
    func getGenre(){
        
        APICaller.getGenreMovies { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let trendingMovieData):
                self?.dataSourceGenre = trendingMovieData
                
                self?.mapGenreData()
            case .failure(let err):
                print(err)
            }
        }
        
    }
    
    private func mapMovieData() {
        movies.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    private func mapGenreData() {
        genres.value = self.dataSourceGenre?.genres.compactMap({GenreMoveViewModel(genre:  $0)})
        //print(GenreMoveViewModel.self)
    }
    
//    func getMovieTitle(_ movie: Movie) -> String {
//        return movie.title ?? movie.name ?? ""
//    }
//    func getMovieGener(_ ganer: Genre) -> String {
//        return ganer.name
//    }
    
    func retriveMovie(withId id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        
        return movie
    }
    func retriveMovieGener(withId id: Int) -> Genre? {
        guard let genres = dataSourceGenre?.genres.first(where: {$0.id == id}) else {
            return nil
        }
        
        return genres
    }
}
