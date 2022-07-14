//
//  PopularCollectionViewCell.swift
//  Challenge-triunfo
//
//  Created by acrn on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIndentifier = "popularCell"
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(title: String, image: UIImage){
        titleLabel.text = title
        self.image.image = image
    }
    
}
