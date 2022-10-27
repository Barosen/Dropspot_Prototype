//
//  TakeOwnShipViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-10-03.
//

import UIKit

class TakeOwnShipViewController: UIViewController {

    @IBOutlet weak var SubmitDesign: UIButton!
    
    @IBOutlet weak var StackDesign: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SubmitDesign.layer.cornerRadius = 20
        StackDesign.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnSubmit(_ sender: Any) {
       
        
        //navigationController?.popViewController(animated: true)

       // dismiss(animated: true, completion: nil)
        
        
        
        //let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        //self.navigationController?.pushViewController(storyboard, animated: true)
        
        //performSegue(withIdentifier: "screen", sender: self)
        //self.navigationController?.popViewController(animated: true)
        
    }
    


}
