//
//  ViewController.swift
//  Dropspot
//
//  Created by Marcus Johansson on 2022-09-12.
//

import UIKit

class FlowViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
   // @IBOutlet weak var FlowTableViewCell: UITableViewCell!
   
    

  
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
        
        // TableView Header
        
        header = StretchyTableViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width / 3.1))
        header?.button.addTarget(self, action: #selector(headerButtonOne(_:)), for: .touchUpInside)
        header?.button.layer.cornerRadius = 15
        header?.button.setTitleColor(UIColor.label, for: .normal)
        header?.button.setTitle("Följer", for: .normal)
        header?.button.sizeToFit()
        
        header?.buttonTwo.addTarget(self, action: #selector(headerButtonTwo(_:)), for: .touchUpInside)
        header?.buttonTwo.layer.cornerRadius = 15
        header?.buttonTwo.setTitleColor(UIColor.label, for: .normal)
        header?.buttonTwo.setTitle("Allmänt", for: .normal)
        header?.buttonTwo.sizeToFit()
        
        tableView.tableHeaderView = header
        
        // NavigationBar-Label
        
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.italicSystemFont(ofSize: 30.0)
        label.text = "DropSpot"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
 
    
    @objc func headerButtonOne(_ sender:UIButton) {
        print("One")
        header?.button.backgroundColor = .tertiaryLabel
        header?.buttonTwo.backgroundColor = .clear
    }
    
    @objc func headerButtonTwo(_ sender:UIButton) {
        print("Two")
        header?.button.backgroundColor = .clear
        header?.buttonTwo.backgroundColor = .tertiaryLabel
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
    
}
struct Annonce{
    var title : String
    var image : String

}

