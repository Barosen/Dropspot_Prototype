//
//  ViewController.swift
//  Dropspot
//
//  Created by Marcus Johansson on 2022-09-12.
//

import UIKit

class FlowViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var header: StretchyTableViewHeader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAndDesignDetails()
    }

    func tableViewAndDesignDetails() {
        
        // TableView Header
        
        header = StretchyTableViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width / 3.1))
        header?.button.addTarget(self, action: #selector(headerButtonOne(_:)), for: .touchUpInside)
        header?.button.layer.cornerRadius = 15
        header?.button.setTitleColor(UIColor.label, for: .normal)
        header?.button.setTitle("Följer", for: .normal)
        header?.button.sizeToFit()
        
        header?.buttonTwo.addTarget(self, action: #selector(headerButtonTwo(_:)), for: .touchUpInside)
        header?.buttonTwo.layer.cornerRadius = 15
        header?.buttonTwo.setTitleColor(UIColor.label, for: .normal)
        header?.buttonTwo.setTitle("Allmänt", for: .normal)
        header?.buttonTwo.sizeToFit()
        
        tableView.tableHeaderView = header
        
        // NavigationBar-Label
        
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.italicSystemFont(ofSize: 30.0)
        label.text = "DropSpot"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    @objc func headerButtonOne(_ sender:UIButton) {
        print("One")
        header?.button.backgroundColor = .tertiaryLabel
        header?.buttonTwo.backgroundColor = .clear
    }
    
    @objc func headerButtonTwo(_ sender:UIButton) {
        print("Two")
        header?.button.backgroundColor = .clear
        header?.buttonTwo.backgroundColor = .tertiaryLabel
    }

}

