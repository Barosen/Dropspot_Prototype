//
//  ProfileViewController.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-09-12.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPayment(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "paymentvc") as? PaymentViewController else {return}
        if let sheet = vc.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]
        }
        present(vc, animated: true)
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
