//
//  CatalogItemsCollectionViewCell.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class CatalogItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    let disposeBag = DisposeBag()
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
    }
    
    func configureView(image: String) {
        let url = URL(string: image)
        imageView.kf.setImage(with: url)
    }
}
