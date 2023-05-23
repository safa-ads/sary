//
//  BannerView.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit
import RxSwift
import RxCocoa

protocol BannerViewDelegate: AnyObject {
    func didTapOnBanner(image: String)
}

class BannerView: UIView, NibLoadable {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: CustomPageControlView!
    
    var banners = PublishSubject<[Banner.BannerData]>()
    let disposeBag = DisposeBag()
    weak var delegate: BannerViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
        setupBindings()
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
    }
    
    private func setupBindings() {
        Observable.zip(collectionView.rx.itemSelected, collectionView.rx.modelSelected(Banner.BannerData.self))
            .bind { [weak self] indexPath, model in
                self?.delegate?.didTapOnBanner(image: model.photo)
        }.disposed(by: disposeBag)
        
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
