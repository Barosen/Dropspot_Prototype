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

    func prepareForSegue(segue: UIStoryboardSegue, sender: [Annonce]?) {
        if segue.identifier == "showRecentAnnonce"{
            let destinationVC = segue.destination as! CompanyFlowViewController


            destinationVC.list2 = sender as [Annonce]?

        }

        // Create a variable that you want to send

        }



    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBar.barTintColor = UIColor.green
        tableView.delegate = self
        tableView.dataSource = self


       tableViewAndDesignDetails()
    }

    func tableViewAndDesignDetails() {

        btnProfile = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
        btnProfile.setTitle("Following", for: .normal)
        //btnProfile.backgroundColor = UIColor.label.withAlphaComponent(0.7)
        btnProfile.backgroundColor = UIColor.systemGray
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
        tableView.reloadData()
        print("Working")
    }

  /*  @IBAction func btnCommentsPress(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "commentsflowvc") as?FlowCommentsViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        vc.boxTry=testBox
        present(vc,animated: true)



    }*/

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
    @objc func setFav(_ sender:UIButton){
        if (MainList.annonces[sender.tag].favorite==true){
            MainList.annonces[sender.tag].favorite=false
            
        }else{
            MainList.annonces[sender.tag].favorite=true
            
        }
        tableView.reloadData()
        
    }
    
    @objc func setFollFav(_ sender:UIButton){
        
        if(FollowingList.annonces[sender.tag].favorite==true){
            FollowingList.annonces[sender.tag].favorite=false
        }else{
            FollowingList.annonces[sender.tag].favorite=true
        }
        tableView.reloadData()
    }
    
    @objc func shareBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FlowShare") as?FlowShareViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        
        present(vc,animated: true)

        
    }
    @objc func commentsBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "commentsflowvc") as?FlowCommentsViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        vc.boxTry=MainList.annonces[sender.tag].comments
        present(vc,animated: true)
        tableView.reloadData()
        
        
        
    }
    
    @objc func commFollBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "commentsflowvc") as?FlowCommentsViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        vc.boxTry=FollowingList.annonces[sender.tag].comments
        present(vc,animated: true)
        tableView.reloadData()

        
        
        
    }

}




class FlowTableViewCell: UITableViewCell{
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!

    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var companyImageView: UIImageView!

    
   /* override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }*/
    

}

extension FlowViewController : UITableViewDelegate{


      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

          if let vc = self.storyboard?.instantiateViewController(withIdentifier: "companyProfile") as? CompanyProfile{
              vc.companyName = MainList.annonces[indexPath.row].companyName
              self.navigationController?.pushViewController(vc, animated: true)}


              /*
               let storyboard = UIStoryboard(name: "CompanyFlowViewController", bundle: nil)
               let vc = storyboard.instantiateInitialViewController()!
               self.present(vc, animated: true, completion: nil)
               */
              // performSegue(withIdentifier: "showRecentAnnonce", sender: self)
              // your code ...
              print (indexPath)


    }


}



extension FlowViewController : UITableViewDataSource{



     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         tableView.isPagingEnabled = true
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath) as! FlowTableViewCell
         if (valueToCheck == 0){
             
             let annonce = MainList.annonces[indexPath.row]
             let image = UIImage(named: "favoriteOn")
             let image2 = UIImage(named: "favorite5")

             cell.favoriteButton.tag = indexPath.row
             cell.commentButton.tag = indexPath.row
             cell.shareButton.addTarget(self, action: #selector(shareBtn(_:)), for: .touchUpInside)
             cell.favoriteButton.addTarget(self, action: #selector(setFav(_:)), for: .touchUpInside)
             cell.commentButton.addTarget(self, action: #selector(commentsBtn(_:)), for: .touchUpInside)

            cell.companyImageView.image = UIImage(named: annonce.image)

            //cell.commentButton.setImage(UIImage(named: "commentButton"), for: UIControl.State())
             if (annonce.favorite){

                cell.favoriteButton.setImage(image, for: UIControl.State.normal)
                 //cell.favoriteButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)

                // cell.favoriteButton.contentMode = UIView.ContentMode.center

             } else {
                 cell.favoriteButton.setImage(image2, for: UIControl.State.normal)
                // cell.favoriteButton.contentMode = UIView.ContentMode.center
             }

            //cell.favoriteButton.setImage(UIImage(named: "favoriteButton"), for: UIControl.State())
            //cell.shareButton.setImage(UIImage(named: "shareButton"), for: UIControl.State())
            //cell.followButton.setImage(UIImage(named: "followButton"), for: UIControl.State())




            return cell

         } else {
             
             let annonce = FollowingList.annonces[indexPath.row]
             let image = UIImage(named: "favoriteOn")
             let image2 = UIImage(named: "favorite5")

             cell.favoriteButton.tag = indexPath.row
             cell.commentButton.tag = indexPath.row
             cell.shareButton.addTarget(self, action: #selector(shareBtn(_:)), for: .touchUpInside)
             cell.favoriteButton.addTarget(self, action: #selector(setFollFav(_:)), for: .touchUpInside)
             cell.commentButton.addTarget(self, action: #selector(commFollBtn(_:)), for: .touchUpInside)
            cell.companyImageView.image = UIImage(named: annonce.image)

            //cell.commentButton.setImage(UIImage(named: "commentButton"), for: UIControl.State())
             if (annonce.favorite){

                cell.favoriteButton.setImage(image, for: UIControl.State.normal)
                 //cell.favoriteButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)

                // cell.favoriteButton.contentMode = UIView.ContentMode.center

             } else {
                 cell.favoriteButton.setImage(image2, for: UIControl.State.normal)
                // cell.favoriteButton.contentMode = UIView.ContentMode.center
             }

            //cell.favoriteButton.setImage(UIImage(named: "favoriteButton"), for: UIControl.State())
            //cell.shareButton.setImage(UIImage(named: "shareButton"), for: UIControl.State())
            //cell.followButton.setImage(UIImage(named: "followButton"), for: UIControl.State())




            return cell

         }

    }


    func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        if (valueToCheck == 0){
            return MainList.annonces.count
        } else {
            return FollowingList.annonces.count
        }

    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let navigate = UIContextualAction(style: .normal, title: "") {
            (action , view , competionHandler) in
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyFlowViewController") as? CompanyFlowViewController{
                vc.list2 = MainList.annonces.filter{annonse in
                    return (annonse.companyName == MainList.annonces[indexPath.row].companyName)}
                self.navigationController?.pushViewController(vc, animated: true)}
            competionHandler(true)
        }
        navigate.backgroundColor = UIColor.black


        let swipe = UISwipeActionsConfiguration(actions: [navigate])
        return swipe
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let navigate = UIContextualAction(style: .normal, title: "") {
            (action , view , competionHandler) in
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "companyProfile") as? CompanyProfile{
                vc.companyName = MainList.annonces[indexPath.row].companyName
                self.navigationController?.pushViewController(vc, animated: true)}
            competionHandler(true)
        }
        navigate.backgroundColor = UIColor.black

        let swipe = UISwipeActionsConfiguration(actions: [navigate])
        return swipe
    }




}
struct Annonce : Identifiable{
    let id = UUID()
    var title : String
    var image : String
    var companyName : String
    var favorite : Bool
    var discounts : Bool
    var release : Bool
    var event : Bool
    var NearBy : Bool
    var comments : [comment]




}
struct MainList {
    static var annonces = [

        
        Annonce( title: "rabat" ,image: "mcRabat", companyName: "McDonalds", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Nice deal!", image: "steve.png"),comment(title: "Now i got hungry!", image: "bill"),comment(title: "Tasty!", image: "cat")]),
        Annonce( title: "elektronik" ,image: "media5", companyName: "Mediamarkt", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Cool stuff", image: "bill"),comment(title: "Time for an upgrade!", image: "steve"),comment(title: "Cables?", image: "cat")]),
        Annonce( title: "kläder" ,image: "image1", companyName: "H&M", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Winter is coming", image: "bill"),comment(title: "Been looking for something like this!", image: "steve")]),
        Annonce( title: "Food" ,image: "McDonalds", companyName: "McDonalds", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Now that look tasty!", image: "cat")]),
        Annonce( title: "kläder" ,image: "lager4", companyName: "Lager157", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Noice!", image: "steve")]),
        Annonce( title: "elektronik" ,image: "media4", companyName: "Mediamarkt", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Power to the people", image: "bill")]),
        Annonce( title: "rabat" ,image: "discount", companyName: "McDonalds", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Yay cheaper food", image: "cat")]),
        Annonce( title: "kläder" ,image: "sale50%", companyName: "H&M", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "50% wow!", image: "steve")]),
        Annonce( title: "kläder" ,image: "lager3", companyName: "Lager157", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Lager 157 always a favorite!", image: "steve")]),
        Annonce( title: "event" ,image: "mcEvent", companyName: "McDonalds", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "I will bring friends!", image: "cat")]),
        Annonce( title: "kläder" ,image: "sale50%2", companyName: "H&M", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Maybe a new shirt?", image: "steve")]),
        Annonce( title: "elektronik" ,image: "media2", companyName: "Mediamarkt", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Very good products!", image: "bill")]),
        Annonce( title: "rabat" ,image: "discount", companyName: "McDonalds", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Purrfect!", image: "cat")]),
        Annonce( title: "kläder" ,image: "lager1", companyName: "Lager157", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Cool", image: "bill")]),
        Annonce( title: "rabat" ,image: "mcEvent1", companyName: "McDonalds", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Awesome!", image: "cat")]),

        Annonce( title: "kläder" ,image: "lager2", companyName: "Lager157", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "This is just what i was looking for!", image: "steve")]),



        Annonce( title: "elektronik" ,image: "media1", companyName: "Mediamarkt", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Powerful!", image: "bill")]),
        Annonce( title: "kläder" ,image: "event1", companyName: "H&M", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Not for me thank you!", image: "cat")]),







    ]

}
struct FollowingList{
    static var annonces = [


        Annonce( title: "rabat" ,image: "mcRabat", companyName: "McDonalds", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "First!", image: "cat")]),


        Annonce( title: "kläder" ,image: "lager2", companyName: "Lager157", favorite: false, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "good stuff!", image: "bill")]),



        Annonce( title: "elektronik" ,image: "media1", companyName: "Mediamarkt", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Just what i wanted!", image: "steve")]),
        Annonce( title: "kläder" ,image: "event1", companyName: "H&M", favorite: true, discounts: true, release: false, event: false, NearBy: true,comments: [comment(title: "Great!", image: "bill")]),







    ]

}
