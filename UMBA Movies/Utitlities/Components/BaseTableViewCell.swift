//
//  BaseTableViewCell.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {
    
    open func setup() {
        selectionStyle = .none
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
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
