//
//  CreateAccountViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-09-12.
//

import UIKit

class CreateAccountViewController: UIViewController {


    @IBOutlet weak var btnRegisterDesign: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnRegisterDesign.layer.cornerRadius = 25
    }
    
    @IBAction func btnRegisterNext(_ sender: Any) {
        self.performSegue(withIdentifier: "nextRegisterBtn", sender: self)
    }
    
    

}
