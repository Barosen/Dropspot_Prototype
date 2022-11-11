//
//  CompanyFlowViewController.swift
//  Dropspot
//
//  Created by Ali Zaeri on 2022-10-06.
//

import UIKit

class CompanyFlowViewController: UIViewController {
   
    var list2 : [Annonce]?
    
    
  
    
    
    @IBOutlet weak var companyTableView: UITableView!
   /* var annonces = [
        Annonce( title: "flower" ,image: "image.jpg", companyName: "Flower", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Tjohej!", image: "cat")]),
        Annonce( title: "kläder" ,image: "image1", companyName: "H&M", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),
        Annonce( title: "Food" ,image: "McDonalds", companyName: "McDonalds", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),
        Annonce( title: "rabat" ,image: "discount", companyName: "McDonalds", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),
        Annonce( title: "kläder" ,image: "event1", companyName: "H&M", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),
        Annonce( title: "kläder" ,image: "sale50%", companyName: "H&M", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),
        Annonce( title: "kläder" ,image: "sale50%2", companyName: "H&M", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),
        Annonce( title: "kläder" ,image: "sale70%", companyName: "H&M", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),
        Annonce( title: "rabat" ,image: "discount", companyName: "McDonalds", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),

        Annonce( title: "event" ,image: "mcEvent", companyName: "McDonalds", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yes!", image: "steve")]),
        
    ]*/
    override func viewDidLoad() {
        super.viewDidLoad()
        companyTableView.delegate = self
        companyTableView.dataSource = self
        navigationController?.navigationBar.barTintColor = UIColor.black

        // Do any additional setup after loading the view.
    }
    @objc func setCompFav(_ sender:UIButton){
        
        if(list2![sender.tag].favorite==true){
            list2![sender.tag].favorite=false
        }else{
            list2![sender.tag].favorite=true
        }
        companyTableView.reloadData()
    }
    
    @objc func shareCompBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FlowShare") as?FlowShareViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        
        present(vc,animated: true)

        
    }
    @objc func commentsCompBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "commentsflowvc") as?FlowCommentsViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        vc.boxTry=list2![sender.tag].comments
        present(vc,animated: true)
        companyTableView.reloadData()
        
        
        
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
        
        return list2?.count ??  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.isPagingEnabled = true
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CompanyFlowCell
        
        cell.favoriteBtnCell.layer.shadowColor = UIColor.black.cgColor
        cell.favoriteBtnCell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.favoriteBtnCell.layer.shadowRadius = 5
        cell.favoriteBtnCell.layer.shadowOpacity = 1.0
        
        cell.shareBtnCell.layer.shadowColor = UIColor.black.cgColor
        cell.shareBtnCell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.shareBtnCell.layer.shadowRadius = 5
        cell.shareBtnCell.layer.shadowOpacity = 1.0
        
        cell.commentBtnCell.layer.shadowColor = UIColor.black.cgColor
        cell.commentBtnCell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.commentBtnCell.layer.shadowRadius = 5
        cell.commentBtnCell.layer.shadowOpacity = 1.0
        
        cell.FollowBtnCell.layer.shadowColor = UIColor.black.cgColor
        cell.FollowBtnCell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.FollowBtnCell.layer.shadowRadius = 5
        cell.FollowBtnCell.layer.shadowOpacity = 1.0
        
        cell.favoriteBtnCell.tag = indexPath.row
        cell.commentBtnCell.tag = indexPath.row
        cell.shareBtnCell.addTarget(self, action: #selector(shareCompBtn(_:)), for: .touchUpInside)
        cell.favoriteBtnCell.addTarget(self, action: #selector(setCompFav(_:)), for: .touchUpInside)
        cell.commentBtnCell.addTarget(self, action: #selector(commentsCompBtn(_:)), for: .touchUpInside)
        
        let annonce = list2![indexPath.row]
        let image = UIImage(named: "favoriteOn")
        let image2 = UIImage(named: "favorite5")
        
        cell.companyImageViewCell.image = UIImage(named: annonce.image)
        cell.commentBtnCell.setImage(UIImage(named: "commentButton"), for: UIControl.State())
        
        
        
        
        
        if (annonce.favorite){
            
           cell.favoriteBtnCell.setImage(image, for: UIControl.State.normal)
            //cell.favoriteButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)

           // cell.favoriteButton.contentMode = UIView.ContentMode.center
            
        } else {
            cell.favoriteBtnCell.setImage(image2, for: UIControl.State.normal)
           // cell.favoriteButton.contentMode = UIView.ContentMode.center
        }
        cell.shareBtnCell.setImage(UIImage(named: "shareButton"), for: UIControl.State())
        cell.FollowBtnCell.setImage(UIImage(named: "followButton"), for: UIControl.State())
        return cell
         
        
        
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let navigate = UIContextualAction(style: .normal, title: "") {
            (action , view , competionHandler) in
            self.navigationController?.popViewController(animated: true)
           
            competionHandler(true)
        }
      
        navigate.backgroundColor = UIColor.black
        let swipe = UISwipeActionsConfiguration(actions: [navigate])
        return swipe
    }
    
 
}

