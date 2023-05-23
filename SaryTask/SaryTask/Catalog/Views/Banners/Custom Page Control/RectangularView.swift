//
//  RectangularView.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 23/05/2023.
//

import UIKit

class RectangularView: UIView, NibLoadable {
   
    @IBOutlet weak var subView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 2
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
        awakeFromNib()
    }
}
