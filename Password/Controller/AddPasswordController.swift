//
//  AddPasswordController.swift
//  Password
//
//  Created by Barış Ertaş on 23.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit
import Firebase


protocol AddPasswordDelegate {
  func addPasswords(password: Passwords)
}

class AddPasswordController: UIViewController {
  
  var delegate: AddPasswordDelegate?
  

  let loginNameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter a login name"
    textField.layer.borderWidth = 1
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.textAlignment = .center
    return textField
  }()
  
  
  // username or e-mail etc.
  let nameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter an e-mail, username etc."
    textField.layer.borderWidth = 1
    textField.textAlignment = .center
    textField.layer.borderColor = UIColor.lightGray.cgColor
    return textField
  }()
  
  let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter a password"
    textField.layer.borderWidth = 1
    textField.textAlignment = .center
    textField.layer.borderColor = UIColor.lightGray.cgColor
    return textField
  }()
  
  let noteLabel: UILabel = {
    let label = UILabel()
    label.text = "Add notes below"
    return label
  }()
  
  let notesTextView: UITextView = {
    let textView = UITextView()
    textView.layer.borderColor = UIColor.lightGray.cgColor
    textView.textAlignment = .center
    textView.layer.borderWidth = 1
    return textView
  }()
  
  let messageLabel: UILabel = {
    let label = UILabel()
    label.textColor = .red
    label.font = UIFont.systemFont(ofSize: 15)
    return label
  }()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      navigationItem.title = "Add Password"
      configureViewComponents()
    
    }
  
  func configureViewComponents(){

    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveData))
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
    
    view.addSubview(loginNameTextField)
    loginNameTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 50)
    
    view.addSubview(nameTextField)
    nameTextField.anchor(top: loginNameTextField.bottomAnchor, left: loginNameTextField.leftAnchor, bottom: nil, right: loginNameTextField.rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    
    view.addSubview(passwordTextField)
    passwordTextField.anchor(top: nameTextField.bottomAnchor, left: nameTextField.leftAnchor, bottom: nil, right: nameTextField.rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    
    view.addSubview(noteLabel)
    noteLabel.centerX(inView: view)
    noteLabel.anchor(top: passwordTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
    
    view.addSubview(notesTextView)
    notesTextView.anchor(top: noteLabel.bottomAnchor, left: passwordTextField.leftAnchor, bottom: nil, right: passwordTextField.rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
    
    view.addSubview(messageLabel)
    messageLabel.centerX(inView: view)
    messageLabel.anchor(top: notesTextView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

  }
  
  @objc func cancel(){
    self.dismiss(animated: true, completion: nil)
  }
  
  // pass data when didselectrowat run
  func setup(password: Passwords){
    loginNameTextField.text = password.loginName
    nameTextField.text = password.userName
    passwordTextField.text = password.password
    notesTextView.text = password.notes
  }
  
  @objc func saveData(){
    
    
    guard let loginName = self.loginNameTextField.text else { return }
    guard let name = self.nameTextField.text else { return }
    guard let password = self.passwordTextField.text else { return }
    
    let info = Passwords(loginName: loginName, userName: name, password: password, notes: self.notesTextView.text)
    self.delegate?.addPasswords(password: info)
    self.dismiss(animated: true, completion: nil)
    
    }
    
  }




