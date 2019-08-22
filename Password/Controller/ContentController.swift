//
//  ContentController.swift
//  Password
//
//  Created by Barış Ertaş on 22.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

class ContentController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(handleLogout))
      
    }

  
    @objc func handleLogout(){
      let homeController = FirstHomeController()
      present(homeController, animated: true, completion: nil)
    }
  
  
}
