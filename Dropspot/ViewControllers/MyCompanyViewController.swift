//
//  MyCompanyViewController.swift
//  Dropspot
//
//  Created by Vincent Pilström Tipmung on 2022-10-13.
//


import UIKit

struct company{
    var name:String
    var adress:String
    var followers:Int
    var image:String
    var phone:String
    var eMail:String
    var orgNr:String
    init(name: String, adress: String, followers: Int, image: String, phone:String,eMail:String,orgNr:String) {
        self.name = name
        self.adress = adress
        self.followers = followers
        self.image = image
        self.phone = phone
        self.eMail = eMail
        self.orgNr = orgNr
    }
}

class MyCompanyViewController:UIViewController{
    
    @IBOutlet weak var CompTitle: UILabel!
    
    @IBOutlet weak var CompAdress: UILabel!
    
    
    @IBOutlet weak var CompPhone: UILabel!
    
    @IBOutlet weak var CompEMail: UILabel!
    
    @IBOutlet weak var CompOrg: UILabel!
    
    @IBOutlet weak var CompImage: UIImageView!
    
    @IBOutlet weak var CompFollowers: UILabel!
    
    
    
    
    
    
    
    
    
    let companies = [company(name: "H&M", adress: "Plöjargatan 7, Göteborg", followers: 137, image: "H&M-Logo.svg",phone:"0534-61816",eMail: "info@hm.se",orgNr: "771122-1234")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CompTitle.text="\(companies[0].name)";
        CompAdress.text="Address: \(companies[0].adress)";
        CompPhone.text="Phone Number: \(companies[0].phone)";
        CompEMail.text="Email: \(companies[0].eMail)";
        CompOrg.text="Organization number: \(companies[0].orgNr)";
        CompFollowers.text="Followers: \(companies[0].followers)";
        CompImage.image = UIImage(named: "\(companies[0].image)");
        
    }
    
}

