//
//  SplashScreenController.swift
//  Dropspot
//
//  Created by Marcus Johansson on 2022-09-20.
//

import UIKit
import AVFoundation

class SplashScreenController: UIViewController {
    @IBOutlet weak var SplashLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        splashaction()
    }
    
    
    @objc
    func splashaction() {
        SplashLabel.text! += "D"
        sound()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.SplashLabel.text! += "r"
            self.sound()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.SplashLabel.text! += "o"
                self.sound()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.SplashLabel.text! += "p"
                    self.sound()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.SplashLabel.text! += "s"
                        self.sound()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.SplashLabel.text! += "p"
                            self.sound()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                self.SplashLabel.text! += "o"
                                self.sound()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    self.SplashLabel.text! += "t"
                                    self.sound()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        self.performSegue(withIdentifier: "Startupdone", sender: nil)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func sound(){
        AudioServicesPlaySystemSound(1306)
    }
}
