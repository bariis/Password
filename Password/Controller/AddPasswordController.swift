//
//  AddPasswordController.swift
//  Password
//
//  Created by Barış Ertaş on 23.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit
import Firebase

class AddPasswordController: UIViewController {

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
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      navigationItem.title = "Add Password"
      configureViewComponents()
    
    }
  
  func configureViewComponents(){

    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveData))
    
    view.addSubview(loginNameTextField)
    loginNameTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 50)
    
    view.addSubview(nameTextField)
    nameTextField.anchor(top: loginNameTextField.bottomAnchor, left: loginNameTextField.leftAnchor, bottom: nil, right: loginNameTextField.rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    
    view.addSubview(passwordTextField)
    passwordTextField.anchor(top: nameTextField.bottomAnchor, left: nameTextField.leftAnchor, bottom: nil, right: nameTextField.rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    
    view.addSubview(noteLabel)
    noteLabel.centerX(inView: view)
    noteLabel.anchor(top: passwordTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
    
    view.addSubview(notesTextView)
    notesTextView.anchor(top: noteLabel.bottomAnchor, left: passwordTextField.leftAnchor, bottom: nil, right: passwordTextField.rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)

  }
  
  @objc func saveData(){
  }



}
