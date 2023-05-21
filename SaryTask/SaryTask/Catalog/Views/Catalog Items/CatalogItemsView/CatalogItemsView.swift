//
//  CatalogItemsView.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit
import RxSwift
import RxCocoa

class CatalogItemsView: UIView, NibLoadable {
    @IBOutlet weak var tableView: UITableView!
    var catalogItems = PublishSubject<[CatalogItems.Items]>()
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    private func configureView() {
        
    }
    
}

