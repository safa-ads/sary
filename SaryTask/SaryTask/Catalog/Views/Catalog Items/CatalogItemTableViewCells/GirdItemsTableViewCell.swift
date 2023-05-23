//
//  GirdItemsTableViewCell.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 22/05/2023.
//

import UIKit
import RxSwift
import RxCocoa

class GirdItemsTableViewCell: UITableViewCell, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var catalogItems = PublishSubject<[CatalogItems.CatalogData]>()
    private let disposeBag = DisposeBag()
    private var numberOfRows: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func configureView(numberOfRows: Int) {
        self.numberOfRows = numberOfRows
        self.layoutSubviews()
    }
        
     
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout = customGirdLayout
    }
    
        private func setupCollectionView() {
            collectionView.register(UINib(nibName: "CatalogItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: CatalogItemsCollectionViewCell.self))
            collectionView.delegate = self
            catalogItems.bind(to: collectionView.rx.items(cellIdentifier: "CatalogItemsCollectionViewCell", cellType: CatalogItemsCollectionViewCell.self)) {  (row,item,cell) in
                cell.configureView(image: item.image)
                self.layoutSubviews()
            }.disposed(by: disposeBag)
        }
        
    private var customGirdLayout: UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 24
        let width = (collectionView.bounds.size.width - 8)/CGFloat(numberOfRows) - 24
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        layout.itemSize = CGSize(
            width: width,
            height: width)
        return layout
    }
}
