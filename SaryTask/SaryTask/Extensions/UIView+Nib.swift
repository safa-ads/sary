//
//  UIView+Nib.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit

public protocol NibLoadable {
    func loadFromNib()
}

public extension NibLoadable where Self: UIView {
    
    func loadFromNib() {
        
        let bundle = Bundle(for: Self.self)
        
        let nibName = (String(describing: type(of: self)) as NSString).components(separatedBy: ".").last!
                
        guard let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {

            print("Could not load nib with name: \(nibName)")
            return
        }
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.frame = bounds

        self.addSubview(view)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
