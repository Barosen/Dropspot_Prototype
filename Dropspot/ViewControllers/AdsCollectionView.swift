//
//  AdsCollectionView.swift
//  Dropspot
//
//  Created by Vincent Pilström Tipmung on 2022-11-11.
//

import UIKit



class AdsCollectionView:UIViewController,UICollectionViewDataSource, UIGestureRecognizerDelegate{
    
    var list2 : [Annonce]?
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list2!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        AdCollectionV.isPagingEnabled = true
        let cell = AdCollectionV.dequeueReusableCell(withReuseIdentifier: "CollVCell", for: indexPath) as! FlowCollectionVCell
        cell.collCommentBtn.layer.shadowColor = UIColor.black.cgColor
        cell.collCommentBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.collCommentBtn.layer.shadowRadius = 5
        cell.collCommentBtn.layer.shadowOpacity = 1.0
        
        cell.collFavBtn.layer.shadowColor = UIColor.black.cgColor
        cell.collFavBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.collFavBtn.layer.shadowRadius = 5
        cell.collFavBtn.layer.shadowOpacity = 1.0
        
        cell.collFollBtn.layer.shadowColor = UIColor.black.cgColor
        cell.collFollBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.collFollBtn.layer.shadowRadius = 5
        cell.collFollBtn.layer.shadowOpacity = 1.0
        
        cell.collShareBtn.layer.shadowColor = UIColor.black.cgColor
        cell.collShareBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.collShareBtn.layer.shadowRadius = 5
        cell.collShareBtn.layer.shadowOpacity = 1.0
        
        cell.collFavBtn.tag = indexPath.row
        cell.collCommentBtn.tag = indexPath.row
        let annonce = list2![indexPath.row]
        let image = UIImage(named: "favoriteOn")
        let image2 = UIImage(named: "favorite5")
        
        cell.collImage.image = UIImage(named: annonce.image)
        cell.collCommentBtn.setImage(UIImage(named: "commentButton"), for: UIControl.State())
        cell.collShareBtn.setImage(UIImage(named: "shareButton"), for: UIControl.State())
        cell.collFollBtn.setImage(UIImage(named: "followButton"), for: UIControl.State())
        
        cell.collShareBtn.addTarget(self, action: #selector(shareBtn(_:)), for: .touchUpInside)
        cell.collFavBtn.addTarget(self, action: #selector(setFav(_:)), for: .touchUpInside)
        cell.collCommentBtn.addTarget(self, action: #selector(commentsBtn(_:)), for: .touchUpInside)
        
        if (annonce.favorite){
            
           cell.collFavBtn.setImage(image, for: UIControl.State.normal)
            
            
        } else {
            cell.collFavBtn.setImage(image2, for: UIControl.State.normal)
           
        }
        
        return cell
        
    }
    
    
    
    
    
    @IBOutlet weak var AdCollectionV: UICollectionView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        AdCollectionV.dataSource = self
        
        let gesture = UIGestureRecognizer()
        gesture.delegate = self
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(leftSwiped(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
            self.view.addGestureRecognizer(swipeLeft)
        
        
        
    }
    
    
    
    
    @objc func leftSwiped(gesture: UISwipeGestureRecognizer)
    {

        print("left swiped ")
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @objc func shareBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FlowShare") as?FlowShareViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        
        present(vc,animated: true)

        
    }
    @objc func commentsBtn(_ sender:UIButton){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "commentsflowvc") as?FlowCommentsViewController else{return}
        if let sheet = vc.sheetPresentationController{
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium()]

        }

        vc.boxTry=MainList.annonces[sender.tag].comments
        present(vc,animated: true)
        AdCollectionV.reloadData()
        
        
        
    }
    
    @objc func setFav(_ sender:UIButton){
        if (list2![sender.tag].favorite==true){
            list2![sender.tag].favorite=false
            
        }else{
            list2![sender.tag].favorite=true
            
        }
        AdCollectionV.reloadData()
        print(list2![sender.tag].favorite)
        
    }
    
    
}
