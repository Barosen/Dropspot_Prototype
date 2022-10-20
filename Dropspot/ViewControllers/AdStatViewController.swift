//
//  AdStatViewController.swift
//  Dropspot
//
//  Created by Vincent Pilström Tipmung on 2022-10-18.
//

import UIKit


struct Ad{
    var title:String
    var followers:Int
    var likes:Int
    var comments:Int
    var shares:Int
    var image:String
    init(title: String, followers: Int, likes: Int, comments: Int, shares: Int,image:String) {
        self.title = title
        self.followers = followers
        self.likes = likes
        self.comments = comments
        self.shares = shares
        self.image = image
    }
    
    
}





class AdStatViewController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var adFollowers: UILabel!
    
    @IBOutlet weak var adLikes: UILabel!
    
    
    @IBOutlet weak var adComments: UILabel!
    
    
    @IBOutlet weak var adShare: UILabel!
    
    
    
    var Ads:[Ad] = [Ad(title: "#Ad1", followers: 5000000, likes: 3, comments: 500, shares: 136,image:"hmads6"),Ad(title: "#Ad2", followers: 200, likes: 150, comments: 350, shares: 250,image: "hmads"),Ad(title: "#Ad3", followers: 23, likes: 50, comments: 10, shares: 55,image:"hmads2"),Ad(title: "#Ad4", followers: 21, likes: 44, comments: 66, shares: 77,image:"hmads3"),Ad(title: "#Ad5", followers: 64, likes: 200, comments: 133, shares: 500,image:"hmads4"),
               Ad(title: "#Ad6", followers: 55, likes: 77, comments: 34, shares: 54,image:"hmads(5)")]
    
    
    
    
    
    
    
   
    
    
    
   
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellAd"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AdStatCell
        
        cell.AdName.text=Ads[indexPath.row].title
        cell.AdImage.image=UIImage(named: Ads[indexPath.row].image)
        return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemFollowers = Ads[indexPath.row].followers
        let itemLikes = Ads[indexPath.row].likes
        let itemComments = Ads[indexPath.row].comments
        let itemShare = Ads[indexPath.row].shares
        updateData(item: (itemFollowers,itemLikes,itemComments,itemShare))
    }
    
   /* func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
    }*/
    
    
    func updateData(item:(followers:Int,likes:Int,comments:Int,shares:Int)){
        
        adFollowers.text="Followers: "+item.followers.description
        adLikes.text="Likes: "+item.likes.description
        adComments.text="Comments: "+item.comments.description
        adShare.text="Shares: "+item.shares.description
        }
    
    override func viewDidLoad() {
        adFollowers.text="Followers: "
        adLikes.text="Likes: "
        adComments.text="Comments: "
        adShare.text="Shares: "
        
    }
    
}
