//
//  FavoritesViewController.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-09-12.
//

import UIKit

class FavoritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableViewFavorit: UITableView!
    
    
    
    
   
    let list2 = MainList.annonces.filter{annonse in
        return (annonse.favorite == true)}
    
 
    
    //var list2 : [Annonce] =
    
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.isPagingEnabled = true
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellFavorit", for: indexPath)
        as! tableViewFavoritCell
        let annonce = self.list2[indexPath.row]
        cell.tableViewFavoritCellBackgrund.image = UIImage(named: annonce.image)
        cell.commentFavoritCellBtn.setImage(UIImage(named: "commentButton"), for: UIControl.State())
       
        cell.shareFavoritCellBtn.setImage(UIImage(named: "shareButton"), for: UIControl.State())
        cell.profileFavoritCellBtn.setImage(UIImage(named: "followButton"), for: UIControl.State())
        let image = UIImage(named: "favoriteOn")
        let image2 = UIImage(named: "favorite5")
        if (annonce.favorite){
            
           cell.favoritFavoritCellBtn.setImage(image, for: UIControl.State.normal)
            //cell.favoriteButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)

           // cell.favoriteButton.contentMode = UIView.ContentMode.center
            
        } else {
            cell.favoritFavoritCellBtn.setImage(image2, for: UIControl.State.normal)
           // cell.favoriteButton.contentMode = UIView.ContentMode.center
        }
        
        
      
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
     
        //performSegue(withIdentifier: "showRecentAnnonce2", sender: self)
     
      print (indexPath)
       
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
