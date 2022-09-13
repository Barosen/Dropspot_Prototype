//
//  CustomTextFiled.swift
//  Dropspot
//
//  Created by Raí Gomes on 2022-09-13.
//

import UIKit

class CustomTextFiled: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customTextFiled()
        
    }
    
    func customTextFiled() {
        let underlineView = UIView()
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .black
        addSubview(underlineView)
        
        NSLayoutConstraint.activate([
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -5),
            underlineView.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
}

extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {return self.placeHolderColor}
        set {self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "" , attributes: [NSAttributedString.Key.foregroundColor : newValue!])}
    }
}
