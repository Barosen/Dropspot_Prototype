//
//  CompanyFlowViewController.swift
//  Dropspot
//
//  Created by Ali Zaeri on 2022-10-06.
//

import UIKit

class CompanyFlowViewController: UIViewController {

    @IBOutlet weak var companyTableView: UITableView!
    let annonces = [
        Annonce(title: "flower", image: "image.jpg"),
        Annonce(title: "kläder", image: "image1"),
        Annonce(title: "Food", image: "McDonalds"),
        Annonce(title: "rabat", image: "discount")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        companyTableView.delegate = self
        companyTableView.dataSource = self

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
class CompanyFlowCell : UITableViewCell{
    @IBOutlet weak var companyImageViewCell: UIImageView!
  
    
    @IBOutlet weak var favoriteBtnCell: UIButton!
    @IBOutlet weak var FollowBtnCell: UIButton!
    
    @IBOutlet weak var shareBtnCell: UIButton!
    
    
   
    @IBOutlet weak var commentBtnCell: UIButton!
    
}
extension CompanyFlowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
      // your code ...
      print (indexPath)
        print("company")
  }
    
}
extension CompanyFlowViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return annonces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CompanyFlowCell
        let annonce = self.annonces[indexPath.row]
        
        cell.companyImageViewCell.image = UIImage(named: annonce.image)
        cell.commentBtnCell.setImage(UIImage(named: "commentButton"), for: UIControl.State())
        cell.favoriteBtnCell.setImage(UIImage(named: "favoriteButton"), for: UIControl.State())
        cell.shareBtnCell.setImage(UIImage(named: "shareButton"), for: UIControl.State())
        cell.FollowBtnCell.setImage(UIImage(named: "followButton"), for: UIControl.State())
        return cell
         
        
        
    }
    
 
}

