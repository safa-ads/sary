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
    private var items: [CatalogItems.Items]?
    
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight =  UITableView.automaticDimension
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
        tableView.register(UINib(nibName: "LinearItemsTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: LinearItemsTableViewCell.self))
        
        tableView.register(UINib(nibName: "GirdItemsTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: GirdItemsTableViewCell.self))
        
        catalogItems.subscribe {[weak self] items in
            self?.items = items.element
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
}

extension CatalogItemsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items else { return UITableViewCell() }
        switch items[indexPath.section].uiType {
        case .linear:
            let cell: LinearItemsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LinearItemsTableViewCell") as! LinearItemsTableViewCell
            cell.catalogItems.onNext(items[indexPath.section].data)
            return cell
        case .grid:
            let cell: GirdItemsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GirdItemsTableViewCell") as! GirdItemsTableViewCell
            cell.configureView(numberOfRows: items[indexPath.section].rowCount)
            cell.catalogItems.onNext(items[indexPath.section].data)
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items?.count ?? 0
    }
}

extension CatalogItemsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CatalogItemsTableViewSection()
        view.configureView(title: items?[section].title ?? "")
        return view
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if items?[section].showTitle == true {
            return 50
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
}


