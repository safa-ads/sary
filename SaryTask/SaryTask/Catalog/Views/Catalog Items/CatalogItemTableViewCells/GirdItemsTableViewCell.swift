//
//  GirdItemsTableViewCell.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 22/05/2023.
//

import UIKit
import RxSwift
import RxCocoa

class GirdItemsTableViewCell: UITableViewCell,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
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
        collectionView.layoutSubviews()
        collectionView.layoutIfNeeded()
        //        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //                //layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        //        let width = collectionView.bounds.size.width/3
        //                layout.itemSize = CGSize(width: width, height: width)
        //                layout.minimumInteritemSpacing = 0
        //                layout.minimumLineSpacing = 0
        //                collectionView!.collectionViewLayout = layout
        //        // collectionView.collectionViewLayout = customGirdLayout
        //        collectionView.layoutSubviews()
        //        self.layoutSubviews()
        //        collectionView.layoutIfNeeded()
        //        self.layoutIfNeeded()
           }
        
     
        private func setupCollectionView() {
            collectionView.register(UINib(nibName: "CatalogItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: CatalogItemsCollectionViewCell.self))
            collectionView.delegate = self
            catalogItems.bind(to: collectionView.rx.items(cellIdentifier: "CatalogItemsCollectionViewCell", cellType: CatalogItemsCollectionViewCell.self)) {  (row,item,cell) in
                cell.configureView(image: item.image)
                self.layoutSubviews()
                self.layoutIfNeeded()
            }.disposed(by: disposeBag)
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.bounds.size.width)/CGFloat(4)
            return CGSize(width: width, height: width)
        }
        

    
//    private var customGirdLayout: UICollectionViewLayout {
//
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 4
//        let width = collectionView.bounds.size.width/CGFloat(numberOfRows)
//
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
//
//
//        layout.itemSize = CGSize(
//            width: width,
//            height: width)
//
//        return layout
//    }
    
}
