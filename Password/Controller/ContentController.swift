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
  var password = [Passwords]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.register(PasswordCell.self, forCellReuseIdentifier: cellId)
      navigationController?.navigationBar.prefersLargeTitles = true
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
    
    let controller = AddPasswordController()
    controller.delegate = self
    self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)

    
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
    return password.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PasswordCell
//    cell.loginNameLabel.text = "Apple"
//    cell.userNameLabel.text = "barujertas@gmail.com"
    let info: Passwords
    info = password[indexPath.row]
    cell.setupCell(with: info)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
    let selectedPassword: Passwords
    selectedPassword = password[indexPath.row]
    let controller = AddPasswordController()
    self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
//    controller.setup(password: selectedPassword, i)
      controller.setup(password: selectedPassword, index: indexPath.row)
  }
  
  
  
  
}


extension ContentController: AddPasswordDelegate {
  
  func addPasswords(password: Passwords) {
    self.dismiss(animated: true) {
      self.password.append(password)

      self.tableView.reloadData()
    }
  }
  
  
}
