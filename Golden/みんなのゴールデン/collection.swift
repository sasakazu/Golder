//
//  collection.swift
//  Golden
//
//  Created by 笹倉一也 on 2019/05/29.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class collection: UIViewController ,UICollectionViewDataSource,
UICollectionViewDelegate {
 
//    var users: Results<Dog>!
    
    var textView:String = ""
    var myId:Int = 0

    var myImage:UIImage? = nil
    var testname:String = ""
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
     
         print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectionView.reloadData()

    }
    
    
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        let realm = try! Realm()
        
        let users = realm.objects(Dog.self)

        return users.count
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        
        let realm = try! Realm()

        
        let users = realm.objects(Dog.self).sorted(byKeyPath: "id", ascending: false)

        let object = users[indexPath.row]

        cell.textView.text = object.hitokoto
        
        cell.imageView.image = object.image
    
      
        
        return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let realm = try! Realm()
        
        
        let users = realm.objects(Dog.self).sorted(byKeyPath: "id", ascending: false)
        
        let object = users[indexPath.row]
        
//        textView = object.hitokoto
        
        myId = object.id
        
        print("id:\(object.id)")
        
         performSegue(withIdentifier: "goDetail",sender: nil)
        
        
    }

 
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "goDetail") {
            
            let secondVC: collectionDetail = (segue.destination as? collectionDetail)!
            
//            secondVC.reciveTextView = textView
            secondVC.Id = myId
            
     
            
            
        }
        
    }

}
