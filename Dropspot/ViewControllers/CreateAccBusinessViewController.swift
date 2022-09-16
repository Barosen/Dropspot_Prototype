//
//  CreateAccBusinessViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-09-16.
//

import UIKit

class CreateAccBusinessViewController: UIViewController {

    @IBOutlet weak var BusinessRegisterBtDesign: UIButton!
    
    
    @IBOutlet weak var BusinessImgDesign: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BusinessRegisterBtDesign.layer.cornerRadius = 20
        BusinessImgDesign.layer.cornerRadius = 20
        

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
