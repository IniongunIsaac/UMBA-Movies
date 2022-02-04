//
//  BaseScrollView.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 01/01/2022.
//

import UIKit

class BaseScrollView: BaseView {
    
    let scrollView = UIScrollView()
    
    override func setup() {
        super.setup()
        scrollView.do {
            addSubview($0)
            $0.fillSuperview()
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
        }
        addConstraints()
    }
    
    override func layout() {
        super.layout()
        self.layoutIfNeeded()
    }
    
    func _addSubviews(_ views: UIView...) {
        scrollView.addSubviews(views)
    }
    
    func addConstraints() {}
    
    var _topAnchor: NSLayoutYAxisAnchor? { scrollView.contentLayoutGuide.topAnchor }
    
    var _bottomAnchor: NSLayoutYAxisAnchor? { scrollView.contentLayoutGuide.bottomAnchor }
    
    var _leadingAnchor: NSLayoutXAxisAnchor? { scrollView.frameLayoutGuide.leadingAnchor }
    
    var _trailingAnchor: NSLayoutXAxisAnchor? { scrollView.frameLayoutGuide.trailingAnchor }
}
