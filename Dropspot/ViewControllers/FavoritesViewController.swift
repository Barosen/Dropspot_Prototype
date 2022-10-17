//
//  FavoritesViewController.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-09-12.
//

import UIKit

class FavoritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableViewFavorit: UITableView!
    let favoritAnnonces = [
        Annonce(title: "flower", image: "image.jpg"),
        Annonce(title: "kläder", image: "image1"),
        Annonce(title: "Food", image: "McDonalds"),
        Annonce(title: "rabat", image: "discount")
        
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritAnnonces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.isPagingEnabled = true
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellFavorit", for: indexPath)
        as! tableViewFavoritCell
        let annonce = self.favoritAnnonces[indexPath.row]
        cell.tableViewFavoritCellBackgrund.image = UIImage(named: annonce.image)
        cell.commentFavoritCellBtn.setImage(UIImage(named: "commentButton"), for: UIControl.State())
        cell.favoritFavoritCellBtn.setImage(UIImage(named: "favoriteButton"), for: UIControl.State())
        cell.shareFavoritCellBtn.setImage(UIImage(named: "shareButton"), for: UIControl.State())
        cell.profileFavoritCellBtn.setImage(UIImage(named: "followButton"), for: UIControl.State())
        
        
      
        
        return cell
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFavorit.delegate = self
        tableViewFavorit.dataSource = self

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
class tableViewFavoritCell: UITableViewCell {
    
    @IBOutlet weak var tableViewFavoritCellBackgrund: UIImageView!
    
    @IBOutlet weak var shareFavoritCellBtn: UIButton!
    
    @IBOutlet weak var profileFavoritCellBtn: UIButton!
    @IBOutlet weak var commentFavoritCellBtn: UIButton!
    
    @IBOutlet weak var favoritFavoritCellBtn: UIButton!
    
}
