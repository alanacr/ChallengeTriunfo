//
//  SearchViewController+UITableViewDataSource.swift
//  Challenge-triunfo
//
//  Created by acrn on 20/07/22.
//

import UIKit
extension SearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell {
            let filme = searchMovies[indexPath.item]
            cell.setup(title: filme.title, date: filme.releaseDate ?? "", image: UIImage())
            Task {
                let imageData = await Movie.downloadImageData(withPath: filme.posterPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: filme.title, date: String(filme.releaseDate?.prefix(4) ?? ""), image: image)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovies.count
    }
}
