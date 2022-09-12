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

        LoginDesignBt.layer.cornerRadius = 25
        NewUserDesignBt.layer.cornerRadius = 25
    }
    

   
}
