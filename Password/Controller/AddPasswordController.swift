//
//  AddPasswordController.swift
//  Password
//
//  Created by Barış Ertaş on 23.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

class AddPasswordController: UIViewController {

  let loginNameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter a login name"
    return textField
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      navigationItem.title = "Add Password"
      configureViewComponents()
    
    }
  
  func configureViewComponents(){

    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveData))
  }
  
  @objc func saveData(){
  }
  
//  func setupComponents(){
//    view.addSubview(loginNameTextField)
//    loginNameTextField.anchor(top: <#T##NSLayoutYAxisAnchor?#>, left: <#T##NSLayoutXAxisAnchor?#>, bottom: <#T##NSLayoutYAxisAnchor?#>, right: <#T##NSLayoutXAxisAnchor?#>, paddingTop: <#T##CGFloat#>, paddingLeft: <#T##CGFloat#>, paddingBottom: <#T##CGFloat#>, paddingRight: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//  }
//


}
