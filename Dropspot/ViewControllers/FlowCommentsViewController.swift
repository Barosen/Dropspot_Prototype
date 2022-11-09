//
//  FlowCommentsViewController.swift
//  Dropspot
//
//  Created by Vincent Pilström Tipmung on 2022-10-25.
//

import Foundation
import UIKit





struct comment{
    var title:String
    var image:String
    init(title: String,image:String) {
        self.title = title
        self.image = image
    }
    
    
}






class FlowCommentsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var boxTry : [comment]?
    
    /*var comments:[comment] = [comment(title: "Cool App", image: "person.circle"),comment(title: "Noice App", image:"person.circle")]
    */
    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var commentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTable.reloadData()
        self.hideKeyboardWhenTappedAround()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return comments.count
        return boxTry!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "commentCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for:indexPath) as! FlowCommentsCell
        //cell.commentText.text=comments[indexPath.row].title
        //cell.commentImage.image=UIImage(systemName: comments[indexPath.row].image)
        
        
        cell.commentText.text=boxTry?[indexPath.row].title
        //cell.commentImage.image=UIImage(systemName: (boxTry?[indexPath.row].image)!)
        cell.commentImage.image=UIImage(named: (boxTry?[indexPath.row].image)!)
        
        return cell
    }
    
    
    
    
    
    @IBAction func postBtn(_ sender: Any) {
        
        
        //print(comments)
        
        if(textInput.text!.isEmpty){
            let alert = UIAlertController(title: "Try Again!", message: "No empty comments pls!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default,handler: nil))
            self.present(alert,animated: true,completion: nil)
            
        }else{
            boxTry!.insert(comment(title: textInput.text ?? "Opsi", image: "cat"), at: 0)}
        commentTable.reloadData()
        
    }
    
    @IBAction func closeSlide(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
}
//Create a method that when tapped outside of keyboard closes the keyboard, can be used on different views
extension UIViewController {
        func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    }
