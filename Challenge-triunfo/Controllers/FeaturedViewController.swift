//
//  FeaturedViewController.swift
//  Challenge-triunfo
//
//  Created by acrn on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
        // Protocolo que define a quantidade de linhas que terão nessa collection view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
        // Protocolo que constói uma célula
        // dequeueReusableCell -> reutilizo uma célula
        
        cell.titleLabel.text = "Título do Filme"
        cell.image.image = UIImage ()
        }
        
        return UICollectionViewCell ()
        // ele espera receber uma CollectionViewCell de um tipo diferente, não do tipo opicional como estou oferecendo. Por isso, estou dando uma segunda opção, caso não receba, poderá retornar uma collectionviewcell padrão vazia ( () -> inicializei vazia). ?? -> segunda opção
        
    }
}

