//
//  SignInController.swift
//  Password
//
//  Created by Barış Ertaş on 22.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit
import Firebase

class SignInController: UIViewController {

  let welcomeLabel: UILabel = {
    let label = UILabel()
    label.text = "Welcome Back!"
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.textColor = .black
    label.textAlignment = .center
    return label
  }()
  
  let warningLabel: UILabel = {
    let label = UILabel()
    label.text = "Enter your email address to restore the data you previously backed up"
    label.textColor = .gray
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  let inputsContainer: UIView = {
    let view = UIView()
    view.layer.borderWidth = 1
    return view
  }()
  
  let emailTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter your e-mail"
    return textField
  }()
  
  let passwordTextField: UITextField = {
      let textField = UITextField()
      textField.placeholder = "Enter your password"
      return textField
  }()
  
  let seperatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("Log in", for: .normal)
    button.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    button.setButtonFeatures(textColor: .black, borderWith: 1, cornerRadius: 5)
    return button
  }()
  
  @objc func loginButtonClicked(){
    guard let email = emailTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    logUserIn(withEmail: email, withPassword: password)
    print("clicked")
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      navigationItem.title = "Login"
      setupComponents()
      
    }
  
  func logUserIn(withEmail email: String, withPassword password: String){
    
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print("Failed to sign user in with error: ", error.localizedDescription)
        return
      }
      
      print("Succesfully logged in")

    }
  }
  
  
  func setupComponents(){
    view.addSubview(welcomeLabel)
    welcomeLabel.centerX(inView: view)
   welcomeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    view.addSubview(warningLabel)
    warningLabel.centerX(inView: view)
    warningLabel.anchor(top: welcomeLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    

    view.addSubview(inputsContainer)
    inputsContainer.centerX(inView: view)
    inputsContainer.anchor(top: warningLabel.bottomAnchor, left: warningLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120)
    
    inputsContainer.addSubview(emailTextField)
    emailTextField.anchor(top: inputsContainer.topAnchor, left: inputsContainer.leftAnchor, bottom: nil, right: inputsContainer.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    
    inputsContainer.addSubview(passwordTextField)
    passwordTextField.anchor(top: emailTextField.bottomAnchor, left: emailTextField.leftAnchor, bottom: nil, right: passwordTextField.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    
    inputsContainer.addSubview(seperatorView)
    seperatorView.anchor(top: emailTextField.bottomAnchor, left: inputsContainer.leftAnchor, bottom: nil, right: inputsContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    
    
    view.addSubview(loginButton)
    loginButton.centerX(inView: view)
    loginButton.anchor(top: passwordTextField.bottomAnchor, left: passwordTextField.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
  }
  
}
