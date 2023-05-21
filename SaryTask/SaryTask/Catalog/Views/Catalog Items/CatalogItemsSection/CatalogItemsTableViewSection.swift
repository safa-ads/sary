//
//  CatalogItemsTableViewSection.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit

class CatalogItemsTableViewSection: UIView, NibLoadable {
    @IBOutlet weak var label: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    private func configureView(title: String) {
        label.text = title
    }
}
