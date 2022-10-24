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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
