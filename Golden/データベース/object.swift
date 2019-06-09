//
//  object.swift
//  Golden
//
//  Created by 笹倉一也 on 2019/05/29.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import Foundation
import RealmSwift


class Dog: Object {

    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var hitokoto = ""

    
    @objc dynamic private var _image: UIImage? = nil
    
    @objc dynamic var image: UIImage? {
      
        set{
            self._image = newValue
            if let value = newValue {
                self.imageData = value.pngData() as NSData?
            }
        }
        get{
            if let image = self._image {
                return image
            }
            if let data = self.imageData {
                self._image = UIImage(data: data as Data)
                return self._image
            }
            return nil
        }
        
    }
    
    @objc dynamic private var imageData: NSData? = nil
   
    override static func ignoredProperties() -> [String] {
        return ["image", "_image"]
    }
    
}



class Partner: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    
    let dogs = List<Dog>()
    


}
