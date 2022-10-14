//
//  FlowOptionsViewController.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-10-13.
//

import UIKit

class FlowOptionsViewController: UIViewController {

    @IBOutlet var notFollowingButton: UIButton!
         @IBOutlet var FollowingButton: UIButton!
         @IBOutlet var viewButtons: UIView!
         @IBOutlet var saveButton: UIButton!

         @IBOutlet var buttonOne: UIButton!
         @IBOutlet var buttonTwo: UIButton!
         @IBOutlet var buttonThree: UIButton!
         @IBOutlet var buttonFour: UIButton!
         @IBOutlet var buttonFive: UIButton!
         var boolOne = false
         var boolTwo = false
         var boolThree = false
         var boolFour = false
         var boolFive = false

         let circleFillConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .small)

         let circleConfig = UIImage.SymbolConfiguration(pointSize: 26, weight: .light, scale: .small)

         override func viewDidLoad() {
             super.viewDidLoad()

             // Do any additional setup after loading the view.
             styleViewAndButtons()
         }

         func styleViewAndButtons() {
             let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
             buttonOne.setImage(circle, for: .normal)
             buttonTwo.setImage(circle, for: .normal)
             buttonThree.setImage(circle, for: .normal)
             buttonFour.setImage(circle, for: .normal)
             buttonFive.setImage(circle, for: .normal)

             viewButtons.layer.cornerRadius = viewButtons.layer.frame.height / 8

             viewButtons.layer.shadowColor = UIColor.black.cgColor
             viewButtons.layer.shadowOpacity = 0.4
             viewButtons.layer.shadowOffset = .zero
             viewButtons.layer.shadowRadius = 6


             notFollowingButton.clipsToBounds = true
             notFollowingButton.layer.cornerRadius = 10
             notFollowingButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
             notFollowingButton.backgroundColor = .white

             FollowingButton.clipsToBounds = true
             FollowingButton.layer.cornerRadius = 10
             FollowingButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
             FollowingButton.backgroundColor = UIColor.label.withAlphaComponent(0.7)
             FollowingButton.tintColor = .white
             
             saveButton.layer.cornerRadius = 5
             //.layerMaxXMinYCorner, .layerMinXMinYCorner
         }

         @IBAction func savePressed(_ sender: Any) {
             dismiss(animated: true)
         }
         @IBAction func buttonOnePress(_ sender: Any) {
             if boolOne == false {
                 boolOne = true
                 let circleFill = UIImage(systemName: "circle.fill", withConfiguration: circleFillConfig)
                 buttonOne.setImage(circleFill, for: .normal)
             } else {
                 boolOne = false
                 let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
                 buttonOne.setImage(circle, for: .normal)
             }
         }

         @IBAction func buttonTwoPress(_ sender: Any) {
             if boolTwo == false {
                 boolTwo = true
                 let circleFill = UIImage(systemName: "circle.fill", withConfiguration: circleFillConfig)
                 buttonTwo.setImage(circleFill, for: .normal)
             } else {
                 boolTwo = false
                 let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
                 buttonTwo.setImage(circle, for: .normal)
             }

         }
         @IBAction func buttonThreePress(_ sender: Any) {
             if boolThree == false {
                 boolThree = true
                 let circleFill = UIImage(systemName: "circle.fill", withConfiguration: circleFillConfig)
                 buttonThree.setImage(circleFill, for: .normal)
             } else {
                 boolThree = false
                 let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
                 buttonThree.setImage(circle, for: .normal)
             }

         }
         @IBAction func buttonFourPress(_ sender: Any) {
             if boolFour == false {
                 boolFour = true
                 let circleFill = UIImage(systemName: "circle.fill", withConfiguration: circleFillConfig)
                 buttonFour.setImage(circleFill, for: .normal)
             } else {
                 boolFour = false
                 let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
                 buttonFour.setImage(circle, for: .normal)
                 print("working")
             }

         }
         @IBAction func buttonFivePress(_ sender: Any) {
             if boolFive == false {
                 boolFive = true
                 let circleFill = UIImage(systemName: "circle.fill", withConfiguration: circleFillConfig)
                 buttonFive.setImage(circleFill, for: .normal)
             } else {
                 boolFive = false
                 let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
                 buttonFive.setImage(circle, for: .normal)
             }

         }
         @IBAction func followingButtonPress(_ sender: Any) {
             notFollowingButton.backgroundColor = .white
             FollowingButton.backgroundColor = UIColor.label.withAlphaComponent(0.7)
             FollowingButton.tintColor = .white
             notFollowingButton.tintColor = .label
         }
         @IBAction func notFollowingButtonPress(_ sender: Any) {
             FollowingButton.backgroundColor = .white
             notFollowingButton.backgroundColor = UIColor.label.withAlphaComponent(0.7)
             FollowingButton.tintColor = .label
             notFollowingButton.tintColor = .white
         }


     }


