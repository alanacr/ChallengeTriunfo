//
//  FeaturedViewController.swift
//  Challenge-triunfo
//
//  Created by acrn on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    //let upcomingMovies = Movie.upcomingMovies()
    
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
    }
    
}

