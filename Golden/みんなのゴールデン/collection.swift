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
 
    
    let photos = ["nagi", "toko","saya","yumiko","yuyu","yuka","miki","mai","kurumi","katakuriko"]
    
    var users: Results<Dog>!
    
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

        let users = realm.objects(Dog.self)

        let object = users[indexPath.row]

        cell.textView.text = object.hitokoto
        
        cell.imageView.image = object.image
        
        cell.imageView.layer.cornerRadius = 8
        
        
        
        
        return cell
        
        
        
    }

 

}
