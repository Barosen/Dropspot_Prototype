//
//  LoginBusinessViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-09-16.
//

import UIKit

class LoginBusinessViewController: UIViewController {

    @IBOutlet weak var CreateBusinessBtDesign: UIButton!
    @IBOutlet weak var BusinessLoginBtDesign: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateBusinessBtDesign.layer.cornerRadius = 20
        BusinessLoginBtDesign.layer.cornerRadius = 20
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
