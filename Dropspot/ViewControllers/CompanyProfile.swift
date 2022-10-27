//
//  CompanyProfile.swift
//  Dropspot
//
//  Created by Ali Zaery on 2022-10-24.
//
import UIKit

class CompanyProfile: UIViewController {
    var companyName : String = ""
    
    @IBOutlet weak var companyWebsite: UILabel!
    @IBOutlet weak var companyTitle: UILabel!
    
    @IBOutlet weak var companyAddress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyTitle.text = companyName
        companyWebsite.text = "www.\(companyName).com"
        companyAddress.text = "Stockholm huvudKontor \(companyName)"
        

      
    }
    
}
