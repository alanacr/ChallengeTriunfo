//
//  SeeAllTableViewCell.swift
//  Challenge-triunfo
//
//  Created by acrn on 19/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, date: String, image: UIImage ){
        self.posterImage.image = image
        self.dateLabel.text = date
        self.titleLabel.text = title 
    }
}
