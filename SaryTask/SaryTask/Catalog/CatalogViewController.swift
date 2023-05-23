//
//  CatalogViewController.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 20/05/2023.
//

import UIKit
import RxSwift
import RxCocoa
class CatalogViewController: UIViewController {
    
    @IBOutlet weak var catalogItemsView: CatalogItemsView!
    @IBOutlet weak var bannerView: BannerView!
    var viewModel: CatalogViewModelProtocol?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        viewModel?.fetchBanners()
        viewModel?.fetchSections()
    }
    
    private func configureViewModel() {
        viewModel = CatalogViewModel()
        viewModel?.banners.observe(on: MainScheduler.instance).bind(to: bannerView.banners).disposed(by: disposeBag)
        viewModel?.sections.observe(on: MainScheduler.instance).bind(to: catalogItemsView.catalogItems).disposed(by: disposeBag)
        bannerView.delegate = self
    }
}

extension CatalogViewController: BannerViewDelegate {
    func didTapOnBanner(image: String) {
        self.showToast(message: image)
    }
}


