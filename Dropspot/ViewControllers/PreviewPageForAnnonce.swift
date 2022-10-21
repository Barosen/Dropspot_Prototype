//
//  PreviewPageForAnnonce.swift
//  Dropspot
//
//  Created by Ali Zaery on 2022-10-20.
//

import Foundation
import UIKit

class PreviewPageForAnnoce : UIViewController{
    
    @IBOutlet weak var annonce1: UILabel!
    
    @IBOutlet weak var annonce2: UILabel!
    
    @IBOutlet weak var annonce3: UILabel!

    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addGesture()
        self.addGesture1()
        self.addGesture2()
        firstButton.backgroundColor = UIColor.lightGray
        secondButton.backgroundColor = UIColor.lightGray
        thirdButton.backgroundColor = UIColor.lightGray
   

        // Do any additional setup after loading the view.
    }
    
    @IBAction func upploadAndClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func firstButton(_ sender: UIButton) {
        print("buttonTogglepressed")
        sender.backgroundColor = sender.backgroundColor == UIColor.lightGray ? UIColor.systemBlue : UIColor.lightGray
        
    }
    
    @IBAction func secondButton(_ sender: UIButton) {
        sender.backgroundColor = sender.backgroundColor == UIColor.lightGray ? UIColor.systemBlue : UIColor.lightGray
        
        
    }
    
    @IBAction func thirdButton(_ sender: UIButton) {
        sender.backgroundColor = sender.backgroundColor == UIColor.lightGray ? UIColor.systemBlue : UIColor.lightGray
        
    }
    
    
    
    
    
    
    
    
    
    
    func addGesture() {

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
           tap.numberOfTapsRequired = 1
           self.annonce1.isUserInteractionEnabled = true
           self.annonce1.addGestureRecognizer(tap)
       }

       @objc
       func labelTapped(_ tap: UITapGestureRecognizer) {
           print("tapped!")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let SecondVC = storyboard.instantiateViewController(withIdentifier: "annoncePreview") as! AnnoncePreview
               SecondVC.imageName = "discount"
               
               self.present(SecondVC, animated:true, completion:nil)
           
       
       }
    func addGesture1() {

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped1(_:)))
           tap.numberOfTapsRequired = 1
           self.annonce2.isUserInteractionEnabled = true
           self.annonce2.addGestureRecognizer(tap)
       }

       @objc
       func labelTapped1(_ tap: UITapGestureRecognizer) {
           print("tapped!")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let SecondVC = storyboard.instantiateViewController(withIdentifier: "annoncePreview") as! AnnoncePreview
               SecondVC.imageName = "image1"
               
               self.present(SecondVC, animated:true, completion:nil)
           
       
       }
    func addGesture2() {

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped2(_:)))
           tap.numberOfTapsRequired = 1
           self.annonce3.isUserInteractionEnabled = true
           self.annonce3.addGestureRecognizer(tap)
       }

       @objc
       func labelTapped2(_ tap: UITapGestureRecognizer) {
           print("tapped!")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let SecondVC = storyboard.instantiateViewController(withIdentifier: "annoncePreview") as! AnnoncePreview
               SecondVC.imageName = "McDonalds"
               
               self.present(SecondVC, animated:true, completion:nil)
           
       
       }
    
    
}
