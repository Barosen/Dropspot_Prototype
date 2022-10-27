//
//  CreateAccBusinessViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-09-16.
//

import UIKit

class CreateAccBusinessViewController: UIViewController {
    
    
    @IBOutlet weak var RegisterBusiBtDesign: UIButton!
    
    @IBOutlet weak var BusinessImgDesign: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterBusiBtDesign.layer.cornerRadius = 20
        BusinessImgDesign.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerSegue(_ sender: UIButton) {
       
        
        
        //self.navigationController?.popViewController(animated: true)
        /*
        
        performSegue(withIdentifier: "TakeOwnShipViewController", sender: self)
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
         */
        
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
