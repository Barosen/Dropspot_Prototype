//
//  FavoritesViewController.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-09-12.
//

import UIKit

class FavoritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableViewFavorit: UITableView!
    
    
    
    
   
    var favoritList = MainList.annonces.filter{annonse in
        return (annonse.favorite == true)}
    
 
    
    //var list2 : [Annonce] =
    
    func check(i:Int){
        if(favoritList[i].favorite==false){
            
            favoritList.remove(at: i)
            tableViewFavorit.reloadData()
        }
        
        
    }
    
    @objc func favFavBtn(_ sender:UIButton){
        if (favoritList[sender.tag].favorite==true){
            favoritList[sender.tag].favorite=false
            check(i: sender.tag)
            
        }else{
            favoritList[sender.tag].favorite=true
            
        }
        tableViewFavorit.reloadData()
        //print(favoritList[sender.tag].favorite)
        
    }
    
    @objc func shareCellBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FlowShare") as?FlowShareViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        
        present(vc,animated: true)

        
    }
    @objc func commentsCellBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "commentsflowvc") as?FlowCommentsViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        vc.boxTry=favoritList[sender.tag].comments
        present(vc,animated: true)
        tableViewFavorit.reloadData()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritList.count
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let navigate = UIContextualAction(style: .normal, title: "") {
            (action , view , competionHandler) in
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyFlowViewController") as? CompanyFlowViewController{
                vc.list2 = MainList.annonces.filter{annonse in
                    return (annonse.companyName == self.favoritList[indexPath.row].companyName)}
                self.navigationController?.pushViewController(vc, animated: true)}
            competionHandler(true)
        }
      
        
        let swipe = UISwipeActionsConfiguration(actions: [navigate])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.isPagingEnabled = true
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellFavorit", for: indexPath)
        as! tableViewFavoritCell
        
        cell.favoritFavoritCellBtn.layer.shadowColor = UIColor.black.cgColor
        cell.favoritFavoritCellBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.favoritFavoritCellBtn.layer.shadowRadius = 5
        cell.favoritFavoritCellBtn.layer.shadowOpacity = 1.0
        
        cell.shareFavoritCellBtn.layer.shadowColor = UIColor.black.cgColor
        cell.shareFavoritCellBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.shareFavoritCellBtn.layer.shadowRadius = 5
        cell.shareFavoritCellBtn.layer.shadowOpacity = 1.0
        
        cell.commentFavoritCellBtn.layer.shadowColor = UIColor.black.cgColor
        cell.commentFavoritCellBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.commentFavoritCellBtn.layer.shadowRadius = 5
        cell.commentFavoritCellBtn.layer.shadowOpacity = 1.0
        
        cell.profileFavoritCellBtn.layer.shadowColor = UIColor.black.cgColor
        cell.profileFavoritCellBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.profileFavoritCellBtn.layer.shadowRadius = 5
        cell.profileFavoritCellBtn.layer.shadowOpacity = 1.0
        
        cell.favoritFavoritCellBtn.tag = indexPath.row
        cell.commentFavoritCellBtn.tag = indexPath.row
        cell.shareFavoritCellBtn.addTarget(self, action: #selector(shareCellBtn(_:)), for: .touchUpInside)
        cell.commentFavoritCellBtn.addTarget(self, action: #selector(commentsCellBtn(_:)), for: .touchUpInside)
        cell.favoritFavoritCellBtn.addTarget(self, action: #selector(favFavBtn(_:)), for: .touchUpInside)
        
        let annonce = self.favoritList[indexPath.row]
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
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyFlowViewController") as? CompanyFlowViewController{
            vc.list2 = MainList.annonces.filter{annonse in
                return (annonse.companyName == self.favoritList[indexPath.row].companyName)}
            self.navigationController?.pushViewController(vc, animated: true)}
     
        //performSegue(withIdentifier: "showRecentAnnonce2", sender: self)
     
      print (indexPath)
       
  }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFavorit.delegate = self
        tableViewFavorit.dataSource = self
        tableViewFavorit.reloadData()
        print(favoritList)
        navigationController?.navigationBar.barTintColor = UIColor.black
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        
    }
}
