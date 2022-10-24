//
//  annoncePreview.swift
//  Dropspot
//
//  Created by Ali Zaery on 2022-10-20.
//

import Foundation
import UIKit

class AnnoncePreview: UIViewController{
    var imageName: String!
    
    
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var annonsImage: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        annonsImage.image = UIImage(named: imageName)
   

        // Do any additional setup after loading the view.
    }
   
    @IBAction func closeButton(_ sender: UIButton) {
        print("close tryck")
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
