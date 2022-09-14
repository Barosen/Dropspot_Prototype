//
//  LoginBusinessViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-09-14.
//

import UIKit

class LoginBusinessViewController: UIViewController {

    @IBOutlet weak var BussinesLoginBtDesign: UIButton!
    @IBOutlet weak var CreatBussinesBtDesign: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BussinesLoginBtDesign.layer.cornerRadius = 20
        CreatBussinesBtDesign.layer.cornerRadius = 20
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
