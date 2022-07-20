//
//  SearchViewController.swift
//  Challenge-triunfo
//
//  Created by acrn on 20/07/22.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let title = searchController.searchBar.text else{
            return
        }
        
        Task{
            self.searchMovies = await Movie.searchMovieAPI(title: title)
            searchTableView.reloadData()
        }
    }
    
    @IBOutlet var searchTableView: UITableView!
    var searchMovies: [Movie] = []
    
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.dataSource = self
        searchTableView.delegate =  self
        
        self.view.backgroundColor = UIColor(named: "azulzinho")
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Coloca o filme aqui!!"
        searchController.searchBar.searchTextField.textColor = .white
    }
}

