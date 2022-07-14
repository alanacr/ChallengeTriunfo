//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Challenge-triunfo
//
//  Created by acrn on 12/07/22.
//

import UIKit
extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return popularMovies.count
        } else {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
            
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        
        return UICollectionViewCell ()
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIndentifier, for: indexPath) as? PopularCollectionViewCell {
            
            cell.setup(title: popularMovies [indexPath.item].title,
                       image: UIImage(named: popularMovies[indexPath.item].backdrop) ?? UIImage())
            return cell
        }
        return PopularCollectionViewCell ()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIndentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            let titulo: String = nowPlayingMovies[indexPath.item].title
            
            cell.setup2(title: titulo,
                        year: "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))",
                        image: UIImage(named: nowPlayingMovies[indexPath.item].poster) ?? UIImage())
            return cell
        }
        return NowPlayingCollectionViewCell ()
    }
    
}
