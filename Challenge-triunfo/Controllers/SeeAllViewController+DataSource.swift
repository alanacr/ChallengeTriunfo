//
//  SeeAllViewController+DataSource.swift
//  Challenge-triunfo
//
//  Created by acrn on 19/07/22.
//

import UIKit

extension SeeAllViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "seeAllCell", for: indexPath) as? SeeAllTableViewCell {
            let filme = movie[indexPath.item]
            cell.setup(title: filme.title, date: filme.releaseDate, image: UIImage())
            Task {
                let imageData = await Movie.downloadImageData(withPath: filme.backdropPath)
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: filme.title, date: String(filme.releaseDate.prefix(4)), image: image)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}
