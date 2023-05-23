//
//  CustomPageControlView.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 23/05/2023.
//
import UIKit

class CustomPageControlView: UIView, NibLoadable {
    
    @IBOutlet weak var stackView: UIStackView!
    
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
    
    func configureView(numberOfPages: Int) {
        for i in 0 ..< numberOfPages {
            let view = RectangularView()
            view.tag = i
            if i == 0 {
                view.backgroundColor = UIColor(named: "navyBlue")
            } else {
                view.backgroundColor = UIColor(named: "lightGrey")
            }
            stackView.addArrangedSubview(view)
        }
    }
    
    func didChangePage(to page: Int) {
        for subview in stackView.arrangedSubviews {
            if subview.tag == page {
                subview.backgroundColor = UIColor(named: "navyBlue")
            } else {
                subview.backgroundColor = UIColor(named: "lightGrey")
            }
        }
    }
}
