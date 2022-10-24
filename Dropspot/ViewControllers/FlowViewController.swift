//
//  ViewController.swift
//  Dropspot
//
//  Created by Marcus Johansson on 2022-09-12.
//

import UIKit

class FlowViewController: UIViewController {
    
    var itemleft = UIBarButtonItem()
    var valueToCheck = 0
    var btnProfile = UIButton()
    @IBOutlet var tableView: UITableView!
    

  
    var header: StretchyTableViewHeader?
    let annonces = [
        Annonce(title: "flower", image: "image.jpg"),
        Annonce(title: "kläder", image: "image1"),
        Annonce(title: "Food", image: "McDonalds"),
        Annonce(title: "rabat", image: "discount")
        
    ]
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        
       tableViewAndDesignDetails()
    }
    
    func tableViewAndDesignDetails() {
        
        btnProfile = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
        btnProfile.setTitle("Following", for: .normal)
        btnProfile.backgroundColor = UIColor.label.withAlphaComponent(0.7)
        btnProfile.layer.cornerRadius = 12.5
        btnProfile.layer.masksToBounds = true
        btnProfile.addTarget(self, action: #selector(followOrForYouPress), for: .touchUpInside)
        itemleft = UIBarButtonItem(customView: btnProfile)
        self.navigationItem.setLeftBarButton(itemleft, animated: true)
        
        
    }
 
    
    @objc func followOrForYouPress() {
        if valueToCheck == 0 {
            btnProfile.setTitle("For You", for: .normal)
            itemleft = UIBarButtonItem(customView: btnProfile)
            valueToCheck = 1
            animateFollowOrForYouPress()
        } else {
            btnProfile.setTitle("Following", for: .normal)
            itemleft = UIBarButtonItem(customView: btnProfile)
            valueToCheck = 0
            animateFollowOrForYouPress()
        }
        print("Working")
    }
    
    
    @IBAction func barButtonOptionsPress(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "optionsflowvc") as? FlowOptionsViewController else {return}
        if let sheet = vc.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]
        }
        present(vc, animated: true)
    }
    
    
    func animateFollowOrForYouPress() {
        UIView.animate(withDuration: 0.0, animations:{
            self.btnProfile.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations:{
                self.btnProfile.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    self.btnProfile.transform = .identity
                })
            })
        })
    }
    
}

class FlowTableViewCell: UITableViewCell{
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var companyImageView: UIImageView!
    

}

extension FlowViewController : UITableViewDelegate{
    
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
          /*
          let storyboard = UIStoryboard(name: "CompanyFlowViewController", bundle: nil)
          let vc = storyboard.instantiateInitialViewController()!
          self.present(vc, animated: true, completion: nil)
           */
          performSegue(withIdentifier: "showRecentAnnonce", sender: self)
        // your code ...
        print (indexPath)
         
    }

    
}


extension FlowViewController : UITableViewDataSource{
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         tableView.isPagingEnabled = true
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath) as! FlowTableViewCell
        let annonce = self.annonces[indexPath.row]
        cell.companyImageView.image = UIImage(named: annonce.image)
        cell.commentButton.setImage(UIImage(named: "commentButton"), for: UIControl.State())
        cell.favoriteButton.setImage(UIImage(named: "favoriteButton"), for: UIControl.State())
        cell.shareButton.setImage(UIImage(named: "shareButton"), for: UIControl.State())
        cell.followButton.setImage(UIImage(named: "followButton"), for: UIControl.State())
        
        
      
        
        return cell
        
    }
    
    func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        return annonces.count
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let navigate = UIContextualAction(style: .normal, title: "") {
            (action , view , competionHandler) in
            self.performSegue(withIdentifier: "showRecentAnnonce", sender: self)

            print("delete \(indexPath)")
            competionHandler(true)
        }
        let swipe = UISwipeActionsConfiguration(actions: [navigate])
        return swipe
    }
    
}
struct Annonce{
    var title : String
    var image : String

}

