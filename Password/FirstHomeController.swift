//
//  FirstHomeController.swift
//  Password
//
//  Created by Barış Ertaş on 22.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit
import Firebase


class FirstHomeController: UIViewController {
  
  let logoView: UIImageView = {
    let image = UIImageView(image: #imageLiteral(resourceName: "locked64"))
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
  }()
  
  let welcomeLabel: UILabel = {
    let label = UILabel()
    label.text = "Welcome to Password Clone"
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textColor = .gray
    return label
  }()
  
  
  // user registration
  let newUserButton: UIButton = {
    let button = UIButton()
    button.setTitle("Sign Up", for: .normal)
    button.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    button.setButtonFeatures(textColor: .black, borderWith: 1, cornerRadius: 5)
    return button
  }()
  
  // already registered user.
  let registeredUserButton: UIButton = {
    let button = UIButton()
    button.setTitle("Sign In", for: .normal)
    button.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
    button.setButtonFeatures(textColor: .black, borderWith: 1, cornerRadius: 5)
    return button
  }()
  
  @objc func signUpButtonClicked(){
    newUserButton.backgroundColor = .lightGray
    navigationController?.pushViewController(SignUpController(), animated: true)
    print("button clicked")
  }
  
  @objc func signInButtonClicked(){
    registeredUserButton.backgroundColor = .red
    navigationController?.pushViewController(SignInController(), animated: true)
    print("alttaki clicked")
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    
    view.backgroundColor = .white
    setupComponents()
      
    }
  
  
  func setupComponents(){
    view.addSubview(logoView)
    logoView.centerX(inView: view)
    logoView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 150, paddingLeft: 0,  paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
    
    view.addSubview(welcomeLabel)
    welcomeLabel.centerX(inView: view)
    welcomeLabel.anchor(top: logoView.bottomAnchor, left: nil,  bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    view.addSubview(newUserButton)
    newUserButton.centerX(inView: view)
    newUserButton.anchor(top: welcomeLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    view.addSubview(registeredUserButton)
    registeredUserButton.centerX(inView: view)
    registeredUserButton.anchor(top: newUserButton.bottomAnchor, left: newUserButton.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
  }



}
