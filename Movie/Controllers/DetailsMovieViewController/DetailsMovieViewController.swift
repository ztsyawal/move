//
//  DetailsMovieViewController.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lRating: UILabel!
    
    @IBOutlet weak var lGenre: UILabel!
    
    
    
    //View model
    var viewModel: DetailsMovieViewModel
    var action = ""
   
    //var genreDataSourceM: GenreMoveViewModel =  GenreMoveViewModel(genre: Genre)
   
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    var genreDataSource = GenreMoveViewModel.self
  //  var viewModelGener: GenreMoveViewModel
    
//    init(viewModelGener: GenreMoveViewModel) {
//        self.viewModelGener = viewModelGener
//        super.init(nibName: "DetailsMovieViewController", bundle: nil)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        //print(genreDataSource)
        self.title = "Movie Details"
        lGenre.text = action
        titleLabel.text = viewModel.movieTitle
        lRating.text = "\(viewModel.score)"
        movieImageView.sd_setImage(with: viewModel.movieImage)
        descriptionLabel.text = viewModel.movieDescription
        
        movieImageView.round()
    }
   
    
    
    @IBAction func openWeb(_ sender: Any) {
        
        
        
        DispatchQueue.main.async {
            //print(self.viewModel.movieId)
            let controller = WebViewController()
            controller.id = self.viewModel.movieId
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openWeb(movieId: Int) {
        
        
        
    }
}
