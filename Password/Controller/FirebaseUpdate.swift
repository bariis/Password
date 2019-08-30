//
//  FirebaseUpdate.swift
//  Password
//
//  Created by Barış Ertaş on 28.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Firebase {
  
  static let shared = Firebase()
  
  func update(password: Passwords){
    
    guard let userId = Auth.auth().currentUser?.uid else { return }
   // let ref = Database.database().reference().child("users/\(userId)/info")
    
    let updatedPassword = [
      
      "loginName" : password.loginName,
      "passw" : password.password,
      "notes" : password.notes
    
    ] as [String:Any]
    
    Database.database().reference().child("users/\(userId)/info").updateChildValues(updatedPassword) { (error, reference) in
      if let error = error {
        print("Failed to update", error.localizedDescription)
        return
      }
      print("Succesfully update")
    }
    
  }
//  func createUser(withEmail email: String, withPassword password: String ){
//    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//      if let error = error {
//        print("Failed to sign user up with error ",error.localizedDescription)
//        return
//      }
//
//      guard let userId = result?.user.uid else { return }
//
//      let values = ["e-mail": email, "password": password]
//
//      Database.database().reference().child("users").child(userId).updateChildValues(values, withCompletionBlock: { (error, reference) in
//        if let error = error {
//          print("Failed to update database values with error ",error.localizedDescription)
//          return
//        }
//        print("Successfully signed user up...")
//        self.navigationController?.pushViewController(ContentController(), animated: true)
//      })
//
//
//    }
//  }
  
  
  
  
  
}
