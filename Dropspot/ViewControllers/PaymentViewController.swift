//
//  PaymentViewController.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-10-21.
//

import UIKit

class PaymentViewController: UIViewController {
    @IBOutlet var visaButton: UIButton!
    
    @IBOutlet var masterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func placeaddPress(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func visaPress(_ sender: Any) {
        let circleFillConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .small)
        let circleConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .small)
        let circleFill = UIImage(systemName: "circle.fill", withConfiguration: circleFillConfig)
       // let circle = UIImage(systemName: "circle.fill", withConfiguration: circleFillConfig)

        visaButton.setImage(circleFill, for: .normal)
        let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
        masterButton.setImage(circle, for: .normal)
    }
    
    @IBAction func masterPress(_ sender: Any) {
        let circleFillConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .small)
        let circleConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .small)
        let circleFill = UIImage(systemName: "circle.fill", withConfiguration: circleFillConfig)
        masterButton.setImage(circleFill, for: .normal)
        let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
        visaButton.setImage(circle, for: .normal)
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
