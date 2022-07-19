//
//  SeeAllViewController.swift
//  Challenge-triunfo
//
//  Created by acrn on 19/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {
    @IBOutlet var tableViewSeeAll: UITableView!

    
    var movie : [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSeeAll.dataSource = self
        tableViewSeeAll.delegate = self
        
    

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
