//
//  MyCompanyViewController.swift
//  Dropspot
//
//  Created by Vincent Pilström Tipmung on 2022-10-03.
//



import UIKit

struct company{
    var name:String
    var adress:String
    var followers:Int
    var image:String
    init(name: String, adress: String, followers: Int, image: String) {
        self.name = name
        self.adress = adress
        self.followers = followers
        self.image = image
    }
}

class MyCompanyViewController:UIViewController{
    
    @IBOutlet weak var CompTitle: UILabel!
    
    @IBOutlet weak var CompAdress: UILabel!
    
    @IBOutlet weak var CompImage: UIImageView!
    
    @IBOutlet weak var CompFollowers: UILabel!
    
    let companies = [company(name: "HM", adress: "Plöjargatan 7", followers: 137, image: "H&M-Logo.svg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CompTitle.text="\(companies[0].name)";
        CompAdress.text="Adress: \(companies[0].adress)";
        CompFollowers.text="Followers: \(companies[0].followers)";
        CompImage.image = UIImage(named: "\(companies[0].image)");
    }
    
}
