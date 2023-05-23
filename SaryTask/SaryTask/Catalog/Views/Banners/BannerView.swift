//
//  BannerView.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit
import RxSwift
import RxCocoa

class BannerView: UIView, NibLoadable {
    @IBOutlet weak var collectionView: UICollectionView!
    var banners = PublishSubject<[Banner.BannerData]>()
    let disposeBag = DisposeBag()
    @IBOutlet weak var pageControl: CustomPageControlView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
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
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    private func configureView() {
        collectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: BannerCollectionViewCell.self))
        collectionView.delegate = self
        
        banners.bind(to: collectionView.rx.items(cellIdentifier: "BannerCollectionViewCell", cellType: BannerCollectionViewCell.self)) {  (row,banner,cell) in
            cell.configureView(image: banner.photo)
        }.disposed(by: disposeBag)
        
        banners.subscribe {[weak self] items in
            self?.pageControl.isHidden = false
            self?.pageControl.configureView(numberOfPages: items.element?.count ?? 0)
        }.disposed(by: disposeBag)
    }
}

extension BannerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        pageControl.didChangePage(to: page)
    }
}
