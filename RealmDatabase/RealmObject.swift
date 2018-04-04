//
//  RealmObject.swift
//  RealmDatabase
//
//  Created by Andrew on 4/4/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name: String? = nil
    var age = RealmOptional<Int>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}

extension User {
    func writeToRealm() {
        try! uiRealm.write {
            uiRealm.add(self, update: true)
        }
    }
}
