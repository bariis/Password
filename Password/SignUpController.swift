//
//  ViewController.swift
//  Password
//
//  Created by Barış Ertaş on 22.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit
import Firebase

class SignUpController: UIViewController {

  let warningLabel: UILabel = {
    let label = UILabel()
    label.text = "You'll need this password to unlock the app when you open it. Don't forget it. For security reasons there is no way to recover it"
    label.textColor = .gray
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  let inputsContainer: UIView = {
    let view = UIView()
//    view.backgroundColor = .blue
    view.layer.borderWidth = 1
    return view
  }()
  
  let emailTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter your e-mail"
//    textField.backgroundColor = .red
    return textField
  }()
  
  let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter a password"
//    textField.backgroundColor = .blue
    return textField
  }()
  
  let seperatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  let registerButton: UIButton = {
   let button = UIButton()
    button.setTitle("Register", for: .normal)
    button.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
    button.setButtonFeatures(textColor: .black, borderWith: 1, cornerRadius: 5)
    return button
  }()
  
  @objc func registerButtonClicked(){
    guard let email = emailTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    createUser(withEmail: email, withPassword: password)
    print("button clicked")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupComponents()
  }

  func createUser(withEmail email: String, withPassword password: String ){
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print("Failed to sign user up with error ",error.localizedDescription)
        return
      }
      
      guard let userId = result?.user.uid else { return }
      
      let values = ["e-mail": email, "password": password]
      
      Database.database().reference().child("users").child(userId).updateChildValues(values, withCompletionBlock: { (error, reference) in
        if let error = error {
          print("Failed to update database values with error ",error.localizedDescription)
          return
        }
        
        print("Successfully signed user up...")
        
      })
      
      
    }
  }
  
  
  func setupComponents(){
    
    
    
    view.addSubview(warningLabel)
    warningLabel.centerX(inView: view)
    warningLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    view.addSubview(inputsContainer)
    inputsContainer.centerX(inView: view)
    inputsContainer.anchor(top: warningLabel.bottomAnchor, left: warningLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120)
    
    inputsContainer.addSubview(emailTextField)
    emailTextField.anchor(top: inputsContainer.topAnchor, left: inputsContainer.leftAnchor, bottom: nil, right: inputsContainer.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    
    inputsContainer.addSubview(passwordTextField)
    passwordTextField.anchor(top: emailTextField.bottomAnchor, left: emailTextField.leftAnchor, bottom: nil, right: passwordTextField.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    
    inputsContainer.addSubview(seperatorView)
    seperatorView.anchor(top: emailTextField.bottomAnchor, left: inputsContainer.leftAnchor, bottom: nil, right: inputsContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    
    view.addSubview(registerButton)
    registerButton.centerX(inView: view)
    registerButton.anchor(top: inputsContainer.bottomAnchor, left: inputsContainer.leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    
    
  }

}

