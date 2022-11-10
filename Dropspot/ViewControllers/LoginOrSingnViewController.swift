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
        startup()
        self.hideKeyboardWhenTappedAround()
    }
    @IBAction func btnLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "nextTabBar", sender: self)
    }
    

    @IBAction func btnRegister(_ sender: Any) {
        self.performSegue(withIdentifier: "registerView", sender: self)
    }
    
    
    @IBAction func keyDoneMail(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func keyDonePass(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    
    
}
func startup(){
    // Get the Graphics Context
    let context = UIGraphicsGetCurrentContext()

    // Set the rectangle outerline-width
    context?.setLineWidth( 5.0)

    // Set the rectangle outerline-colour
    UIColor.red.set()

    // Create Rectangle
    context?.addRect( CGRect(x: 0, y: 0, width: 100, height: 100))

    // Draw
    context?.strokePath()
}
