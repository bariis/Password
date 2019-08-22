//
//  Extensions.swift
//  Password
//
//  Created by Barış Ertaş on 22.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

extension UIView {
  
  func centerX(inView view: UIView){
    self.translatesAutoresizingMaskIntoConstraints = true
    self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
  }
  
  func centerY(inView view: UIView){
    self.translatesAutoresizingMaskIntoConstraints = true
    self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  
  
  func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    
    if let left = left {
      self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }
    
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }
    
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
}

extension UIButton {
  func setButtonFeatures(textColor: UIColor, borderWith: CGFloat, cornerRadius: CGFloat){
    let button = self
    button.layer.cornerRadius = cornerRadius
    button.layer.borderWidth = borderWith
    button.setTitleColor(textColor, for: .normal)
  }
}

//button.layer.cornerRadius = 5
//button.layer.borderWidth = 1
//button.setTitleColor(.black, for: .normal)
