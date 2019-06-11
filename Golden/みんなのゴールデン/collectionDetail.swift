//
//  collectionDetail.swift
//  Golden
//
//  Created by 笹倉一也 on 2019/05/29.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class collectionDetail: UIViewController {
    
    var reciveTextView:String = ""
    var Id:Int = 0
    
    @IBOutlet weak var imageViewDetail: UIImageView!
    @IBOutlet weak var textViewDetail: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let realm = try! Realm()
        
        
        let users = realm.objects(Dog.self).filter("id == %@", Id).first

        textViewDetail.text = users?.hitokoto
        imageViewDetail.image = users?.image
        
        print(reciveTextView)
        
        
        
    }
    

}
