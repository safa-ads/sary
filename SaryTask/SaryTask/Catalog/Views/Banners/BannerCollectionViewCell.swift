//
//  BannerCollectionViewCell.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit
import Kingfisher

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
    }
    
    func configureView(image: String) {
        let url = URL(string: image)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }
}
