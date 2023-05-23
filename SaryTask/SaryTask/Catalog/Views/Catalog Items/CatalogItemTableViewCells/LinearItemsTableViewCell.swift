//
//  LinearItemsTableViewCell.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit
import RxSwift
import RxCocoa

class LinearItemsTableViewCell: UITableViewCell, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var catalogItems = PublishSubject<[CatalogItems.CatalogData]>()
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        collectionView.register(UINib(nibName: "CatalogItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: CatalogItemsCollectionViewCell.self))
        collectionView.delegate = self
       collectionView.collectionViewLayout = customCollectionViewLayout
        
        catalogItems.bind(to: collectionView.rx.items(cellIdentifier: "CatalogItemsCollectionViewCell", cellType: CatalogItemsCollectionViewCell.self)) {  (row,item,cell) in
            cell.configureView(image: item.image)
        }.disposed(by: disposeBag)
    }
    
}

    private var customCollectionViewLayout: UICollectionViewLayout {
        let cellWidth: CGFloat = 111
        let cellHeight: CGFloat = 124
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        layout.itemSize = CGSize(width: cellWidth,
                                 height: cellHeight)
        layout.minimumLineSpacing = 20
        return layout
}

