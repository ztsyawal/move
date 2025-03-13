//
//  MainViewController.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import UIKit

class MainViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    //var viewModelGenre: GenreMoveViewModel = GenreMoveViewModel()
    
    
    //Variables:
    var moviesDataSource: [MovieTableCellViewModel] = []
    var dataSimpan: [MovieTableCellViewModel] = []
    var filterdata: [MovieTableCellViewModel] = []
    var genreDataSource: [GenreMoveViewModel] = []
    var action = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }
    
    func configView() {
        self.title = "Top Trending Movies"
        self.view.backgroundColor = .systemBackground
        self.searchBar.text = ""
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchBar.text = ""
        viewModel.getGenre()
        viewModel.getData()
       // genres
        
        
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.genres.bind { [weak self] genres
            in
            guard let self = self,
                  let genres = genres else {
                      return
                  }
            self.genreDataSource = genres
        }
        
        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }

            self.moviesDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetails(movieId: Int) {
        guard let movie = viewModel.retriveMovie(withId: movieId) else {
            return
        }
      
        
        DispatchQueue.main.async {
            let detailsViewModel = DetailsMovieViewModel(movie: movie)
            let controller = DetailsMovieViewController(viewModel: detailsViewModel)
            controller.action = self.action
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
