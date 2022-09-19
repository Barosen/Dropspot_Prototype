//
//  stretchyTableViewHeader.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-09-19.
//

import Foundation
//
//  StretchyHeader.swift
//  Odla KBZ
//
//  Created by Kevin Zetterlind on 2022-09-07.
//

import Foundation
import UIKit

final class StretchyTableViewHeader: UIView {
    
    public let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .tertiaryLabel
        button.contentEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        return button
    }()
    
    public let buttonTwo: UIButton = {
        let buttonTwo = UIButton(type: .system)
        buttonTwo.backgroundColor = .clear
        buttonTwo.contentEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        return buttonTwo
    }()
    
    public let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        return stackView
    }()
    
    
    
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()
    
    private var stackViewHeight = NSLayoutConstraint()
    private var stackViewBottom = NSLayoutConstraint()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        createViews()
        setViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createViews() {
        addSubview(containerView)
        
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(buttonTwo)
        containerView.addSubview(stackView)
//        containerView.addSubview(button)
        
        
    }
    
    func setViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 40).isActive = true
        
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
    }
    
}
