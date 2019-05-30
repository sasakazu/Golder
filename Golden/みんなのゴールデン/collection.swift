//
//  collection.swift
//  Golden
//
//  Created by 笹倉一也 on 2019/05/29.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class collection: UIViewController {
    
    
    
    var myImage:UIImage? = nil
    
    @IBOutlet weak var image: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//  イメージを表示する
//        let realm = try! Realm()
//
//        let users = realm.objects(Dog.self).last
//
//        myImage = users?.image
//
//        image.image = myImage
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    

 

}
