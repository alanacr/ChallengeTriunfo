//
//  FeaturedViewController.swift
//  Challenge-triunfo
//
//  Created by acrn on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = []// = Movie.popularMovies()
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        Task {
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            
            self.nowPlayingMovies = await Movie.nowPlayingAPI()
            self.nowPlayingCollectionView.reloadData()
            
            self.upcomingMovies = await Movie.upcomingAPI()
            self.upcomingCollectionView.reloadData()
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue"{
            if let destination = segue.destination as? DetailsViewController {
                let movie = sender as? Movie
                destination.movie = movie
            }
        } else if segue.identifier == "popularButton" {
            if let destination = segue.destination as? SeeAllViewController {
                destination.movie = popularMovies
                destination.seeAllTitle = "Popular"
            }

        } else if segue.identifier == "nowPlayingButton" {
            if let destination = segue.destination as? SeeAllViewController {
                destination.movie = nowPlayingMovies
                destination.seeAllTitle = "Now Playing"

            }
        } else if segue.identifier == "upcomingButton" {
            if let destination = segue.destination as? SeeAllViewController {
                destination.movie = upcomingMovies
                destination.seeAllTitle = "Upcoming"

                
            }
        }
    }
}

