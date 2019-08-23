//
//  ContentController.swift
//  Password
//
//  Created by Barış Ertaş on 22.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit
import Firebase

class ContentController: UITableViewController {
  
  let cellId = "cellId"
  var passwords: [passwordModel] = [passwordModel]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.register(PasswordCell.self, forCellReuseIdentifier: cellId)
      authenticateUserAndConfigureView()
    }

  
    @objc func handleLogout(){
  
      let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
      alertController.addAction(UIAlertAction(title: "Sign out", style: .destructive, handler: { (_) in
        self.signOut()
      }))
      alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      present(alertController, animated: true, completion: nil)
  }
  
  @objc func addPassword(){
    
    navigationController?.pushViewController(AddPasswordController(), animated: true)
    
  }
  
  func signOut(){
    do {
      try Auth.auth().signOut()
      let navController = UINavigationController(rootViewController: FirstHomeController())
      self.present(navController, animated: true, completion: nil)
    } catch let error {
      print("Failed to sign out with error... ",error.localizedDescription)
    }
  }
  
  func loadUserData(){
    guard let userId = Auth.auth().currentUser?.uid else { return }
    Database.database().reference().child("users").child("email").observeSingleEvent(of: .value) { (snapshot) in
      guard let email = snapshot.value as? String else { return }
      self.navigationItem.title = "Welcome \(email)"
      
      UIView.animate(withDuration: 0.5, animations: {
        self.view.backgroundColor = .red
      })
      
    }
  }
  
  func authenticateUserAndConfigureView(){
    if Auth.auth().currentUser == nil {
      DispatchQueue.main.async {
       let navController = UINavigationController(rootViewController: FirstHomeController())
       self.present(navController, animated: true, completion: nil)
      }
    } else {
      configureViewComponents()
      loadUserData()
    }
  }
  
  
  
  func configureViewComponents(){
    
    navigationItem.title = Auth.auth().currentUser?.email
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(handleLogout))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addPassword))
  }
  
}


extension ContentController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PasswordCell
    cell.loginNameLabel.text = "Apple"
    cell.userNameLabel.text = "barujertas@gmail.com"
    cell.passwordLabel.text = "baruj864cr7"
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  
  
  
}
