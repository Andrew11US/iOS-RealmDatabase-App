//
//  ViewController.swift
//  RealmDatabase
//
//  Created by Andrew on 4/3/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        grabData()
    }
    
    func grabData() {
        
        let databaseRef = Database.database().reference()
        databaseRef.child("users").observe(.value) { (snapshot) in
            
            for snap in snapshot.children.allObjects as! [DataSnapshot] {
                
                guard let dictionary = snap.value as? [String: AnyObject] else { return }
                
                print(snap)
                
                // Creating objects
                let name = dictionary["name"] as? String
                let age = dictionary["age"] as? Int
                
                // Adding objects to Realm File
                let UserToAdd = User()
                UserToAdd.name = name
                UserToAdd.age.value = age
                
                // Writing object to Realm Database
                UserToAdd.writeToRealm()
            }
        }
    }
    


}

