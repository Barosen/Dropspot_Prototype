//
//  ViewController.swift
//  Dropspot
//
//  Created by Marcus Johansson on 2022-09-12.
//

import UIKit

class FlowViewController: UIViewController {
    
    var itemleft = UIBarButtonItem()
    var valueToCheck = 0
    var btnProfile = UIButton()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAndDesignDetails()
    }
    
    func tableViewAndDesignDetails() {
        
        btnProfile = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
        btnProfile.setTitle("Following", for: .normal)
        btnProfile.backgroundColor = UIColor.label.withAlphaComponent(0.7)
        btnProfile.layer.cornerRadius = 12.5
        btnProfile.layer.masksToBounds = true
        btnProfile.addTarget(self, action: #selector(followOrForYouPress), for: .touchUpInside)
        itemleft = UIBarButtonItem(customView: btnProfile)
        self.navigationItem.setLeftBarButton(itemleft, animated: true)
        
        
    }
    
    @objc func followOrForYouPress() {
        if valueToCheck == 0 {
            btnProfile.setTitle("For You", for: .normal)
            itemleft = UIBarButtonItem(customView: btnProfile)
            valueToCheck = 1
            animateFollowOrForYouPress()
        } else {
            btnProfile.setTitle("Following", for: .normal)
            itemleft = UIBarButtonItem(customView: btnProfile)
            valueToCheck = 0
            animateFollowOrForYouPress()
        }
        print("Working")
    }
    
    
    @IBAction func barButtonOptionsPress(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "optionsflowvc") as? FlowOptionsViewController else {return}
        if let sheet = vc.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]
        }
        present(vc, animated: true)
    }
    
    
    func animateFollowOrForYouPress() {
        UIView.animate(withDuration: 0.0, animations:{
            self.btnProfile.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations:{
                self.btnProfile.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    self.btnProfile.transform = .identity
                })
            })
        })
    }
    
}




