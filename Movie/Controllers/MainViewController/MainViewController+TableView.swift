//
//  MainViewController+TableView.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
//    let carData = ["Ford", "Mercedes", "Audi", "BMW", "Lamborghini", "Ferrari"]
//    var filterdata: [String]!
    
    
    
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        self.searchBar.delegate = self
        filterdata = moviesDataSource
        dataSimpan = moviesDataSource
        
        
        self.registerCells()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCells() {
        self.tableView.register(MovieTableViewCell.register(), forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //viewModel.numberOfSections()
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //viewModel.numberOfRows(in: section)
        moviesDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
       // print(genreDataSource)
       
        cell.setupCell(viewModel: moviesDataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = moviesDataSource[indexPath.row].id
        //print(moviesDataSource[indexPath.row].genreIDS[0])
        let dataGenerAll :  [GenreMoveViewModel] = genreDataSource
        
        for i in 0..<moviesDataSource[indexPath.row].genreIDS.count {
            genreDataSource = dataGenerAll
            var dataGener :  [GenreMoveViewModel] = []
             dataGener = self.genreDataSource.filter({ $0.genreId == moviesDataSource[indexPath.row].genreIDS[i]})
            genreDataSource = dataGener
            if genreDataSource.count > 0 {
                if i == 0 {
                    self.action = "\(genreDataSource[0].genreName)"
                }else{
                    self.action = "\(self.action), \(genreDataSource[0].genreName)"
                }
            }
            
        }
       // print(self.action)
        
        self.openDetails(movieId: movieId)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String?) {
       // print(genreDataSource)
        if dataSimpan.count == 0 {
            dataSimpan = moviesDataSource
        }else {
            moviesDataSource = dataSimpan
        }
        filterdata = []
        if let searchText = searchText?.lowercased() {
                guard !searchText.isEmpty else {
                    
                    tableView.reloadData()
                    return }
                
                filterdata = self.moviesDataSource.filter({ $0.name.lowercased().contains(searchText) })
        }
        moviesDataSource = filterdata
        filterdata = []
        tableView.reloadData()
           
    }
    
    
}
