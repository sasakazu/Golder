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

    @objc dynamic var name = ""
    @objc dynamic var age = ""
    @objc dynamic var image: UIImage? = nil
    @objc dynamic var hitokoto = ""

}
