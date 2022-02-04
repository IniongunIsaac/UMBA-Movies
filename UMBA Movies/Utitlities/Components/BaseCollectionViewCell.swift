//
//  BaseCollectionViewCell.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    open func setup() {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _addSubviews(_ views: [UIView]) {
        contentView.addSubviews(views)
    }
    
    func _addSubviews(_ views: UIView...) {
        contentView.addSubviews(views)
    }
    
    var _topAnchor: NSLayoutYAxisAnchor? { contentView.topAnchor }
    
    var _bottomAnchor: NSLayoutYAxisAnchor? { contentView.bottomAnchor }
    
    var _leadingAnchor: NSLayoutXAxisAnchor? { contentView.leadingAnchor }
    
    var _trailingAnchor: NSLayoutXAxisAnchor? { contentView.trailingAnchor }
}
