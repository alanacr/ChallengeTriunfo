//
//  TrendingViewController.swift
//  Challenge-triunfo
//
//  Created by acrn on 20/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    var state: Int = 0
    
    //tirar duvida com mv
    
    var todayMovies: [Movie] = []
    var weekMovies: [Movie] = []

    @IBOutlet var trendingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        
        Task{
            self.todayMovies = await Movie.trendingTodayMoviesAPI()
            self.weekMovies = await Movie.trendingWeekMoviesAPI()
            self.trendingCollectionView.reloadData()
        }
    }
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            state = 0
            print(todayMovies.count)
        }
        else if sender.selectedSegmentIndex == 1 {
            state = 1
            print(weekMovies.count)
        }
        trendingCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}
