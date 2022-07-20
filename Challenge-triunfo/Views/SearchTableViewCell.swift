//
//  SearchTableViewCell.swift
//  Challenge-triunfo
//
//  Created by acrn on 20/07/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, date: String, image: UIImage ){
        self.posterImage.image = image
        self.dateLabel.text = date
        self.titleLabel.text = title
    }
}

