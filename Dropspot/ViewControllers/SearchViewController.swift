//
//  SearchViewController.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-09-12.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewAndStylingDetails()
    }
    
    func tableViewAndStylingDetails() {
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "SearchCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchCell")
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Skriv bara tableView funktioner här
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        //Fixa element, exempelvis: cell.myLabel.text = "Coop Forum"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return datainfo.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
}
