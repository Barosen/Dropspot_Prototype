//
//  CreateAccBusinessViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-09-15.
//

import UIKit

class CreateAccBusinessViewController: UIViewController {

    @IBOutlet weak var ImageViewConerRadius: UIImageView!
    @IBOutlet weak var BusinessRegBtDesign: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageViewConerRadius.layer.cornerRadius = 20

        BusinessRegBtDesign.layer.cornerRadius = 20
        
        
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
