//
//  UpcomingCollectionViewCell.swift
//  Challenge-triunfo
//
//  Created by acrn on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup3(title: String, image:UIImage, date: String){
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = date
    }
}
