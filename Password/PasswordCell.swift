//
//  PasswordCell.swift
//  Password
//
//  Created by Barış Ertaş on 23.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

class PasswordCell: UITableViewCell {

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupComponents()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // whether a website or application name etc.
  let loginNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .blue
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()
  
    // username or e-mail etc.
  let userNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()
  
//  let passwordLabel: UILabel = {
//    let label = UILabel()
//    label.textColor = .gray
//    label.font = UIFont.systemFont(ofSize: 16)
//    return label
//  }()
  
  func setupComponents(){
    addSubview(loginNameLabel)
    loginNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    addSubview(userNameLabel)
    userNameLabel.anchor(top: loginNameLabel.bottomAnchor, left: loginNameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//
//    addSubview(passwordLabel)
//    passwordLabel.anchor(top: userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//
  }
}
