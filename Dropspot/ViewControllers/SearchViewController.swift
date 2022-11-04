//
//  SearchViewController.swift
//  Dropspot
//
//  Created by Kevin Zetterlind on 2022-09-12.
//

import UIKit

class SearchViewController: UIViewController {
    
    let data = ["Gucci", "Volkswagen", "Toyota", "Bagetti", "Rolls-Royce", "Koeningsegg", "BananaInc", "Pannkakor AB", "Köttbullar > Falafel"]
    var filteredData: [String]!
    
    
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        filteredData = data
        tableViewAndStylingDetails()
    }
    
    func tableViewAndStylingDetails() {
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "SearchCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchCell")
    }
    
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        filteredData = []
        if searchBar.text == "" {
            filteredData = data
        }
        for word in data {
            if word.uppercased().contains(searchBar.text!.uppercased())
            {
                filteredData.append(word)
            }
        }
        self.tableView.reloadData()
    }
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
}
