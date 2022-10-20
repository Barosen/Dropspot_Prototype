//
//  LoginOrSingnViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-09-12.
//

import UIKit

class LoginOrSingnViewController: UIViewController {
    
   
@IBOutlet weak var LoginDesignBt: UIButton!
@IBOutlet weak var NewUserDesignBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginDesignBt.layer.cornerRadius = 20
        NewUserDesignBt.layer.cornerRadius = 20
        
    }
    @IBAction func btnLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "nextTabBar", sender: self)
    }
    

    @IBAction func btnRegister(_ sender: Any) {
        self.performSegue(withIdentifier: "registerView", sender: self)
    }
    
}
