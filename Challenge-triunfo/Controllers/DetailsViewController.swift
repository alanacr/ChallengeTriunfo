//
//  DetailsViewController.swift
//  Challenge-triunfo
//
//  Created by acrn on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie? 
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(touchInImage))
        posterImage.addGestureRecognizer(gesture)
        posterImage.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
        
        guard let movie = movie else {
            return
        }

        self.title = movie.title
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.backdropImage.image = imagem
            
        }
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.posterImage.image = imagem
        }
        
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating:\(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
    }
    
    @objc func touchInImage() {
        self.performSegue(withIdentifier: "posterSegue", sender: movie)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PosterViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
        
}
