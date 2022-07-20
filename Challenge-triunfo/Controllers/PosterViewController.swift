//
//  PosterViewController.swift
//  Challenge-triunfo
//
//  Created by acrn on 19/07/22.
//

import UIKit

class PosterViewController: UIViewController {
    
    var movie: Movie?
    @IBOutlet var posterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {
            return
        }
        
        title = movie.title
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.posterImage.image = imagem
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
