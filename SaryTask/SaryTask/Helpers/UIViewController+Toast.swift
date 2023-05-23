//
//  UIViewController+Toast.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 23/05/2023.
//

import UIKit

public extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.text = message
        toastLabel.numberOfLines = 0
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        NSLayoutConstraint.activate([
            toastLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            toastLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            toastLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            toastLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
            
        ])
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}


