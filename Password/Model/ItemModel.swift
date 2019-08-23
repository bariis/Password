//
//  ItemModel.swift
//  Password
//
//  Created by Barış Ertaş on 23.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import Foundation

struct passwordModel {
  
  var loginName: String
  var userName: String // e-mail etc.
  var password: String
  var notes: String
  
  init(loginName: String, userName: String, password: String, notes: String ) {
    self.loginName = loginName
    self.userName = userName
    self.password = password
    self.notes = notes
  }
  
}
