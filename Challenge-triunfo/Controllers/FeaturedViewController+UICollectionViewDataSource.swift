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
            return nowPlayingMovies.count
        } else {
            return upcomingMovies.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
            
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else {
            return makeUpcomingCell(indexPath: indexPath)
            
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIndentifier, for: indexPath) as? PopularCollectionViewCell {
            
            cell.setup(title: popularMovies [indexPath.item].title,
                       image: UIImage())
            let movie = popularMovies[indexPath.item]
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: image)
            }
            
            return cell
        }
        return PopularCollectionViewCell ()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIndentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            let titulo: String = nowPlayingMovies[indexPath.item].title
            
            cell.setup(title: titulo,
                       year: "\(nowPlayingMovies[indexPath.item].releaseDate?.prefix(4))",
                       image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath ?? "") ?? UIImage())
            let movie = nowPlayingMovies[indexPath.item]
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, year: "\(movie.releaseDate?.prefix(4))", image: image)
            }
            
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
            
            let movie = upcomingMovies[indexPath.item]
            let dateUpcoming = upcomingMovies[indexPath.item].releaseDate
            let date = DateHandler.shared.getMonth(of: dateUpcoming ?? "")
            
            cell.setup(title: movie.title,
                       image: UIImage(named: upcomingMovies[indexPath.item].posterPath ?? "") ?? UIImage(),
                       year: "\(date) \(upcomingMovies[indexPath.item].releaseDate?.suffix(2))")
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title,
                           image: image,
                           year: "\(date) \(upcomingMovies[indexPath.item].releaseDate?.suffix(2))")
                
            }
            return cell
        }
        return UpcomingCollectionViewCell()
    }
    
}
