//
//  PlaceAdsInfoViewController.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-10-19.
//

import UIKit

class PlaceAdsInfoViewController: UIViewController {

    @IBOutlet weak var ViewStatusUppDesign: UIStackView!
    
    @IBOutlet weak var ViewSubjectsDateDesign: UIStackView!
    
    
    
    @IBOutlet weak var BtnPayDesign: UIButton!
    
    @IBOutlet weak var BtnChooseDesign: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewStatusUppDesign.layer.cornerRadius = 20
        ViewSubjectsDateDesign.layer.cornerRadius = 20
        BtnPayDesign.layer.cornerRadius = 25
        BtnChooseDesign.layer.cornerRadius = 25


        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPayPress(_ sender: Any) {
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
