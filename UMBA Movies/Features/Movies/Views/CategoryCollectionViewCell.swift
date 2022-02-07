//
//  CategoryCollectionViewCell.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 07/02/2022.
//

import UIKit

class CategoryCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate let nameLabel = UILabel(text: "This is great", font: .avenirRegular(16), adjustsFontSizeToFitWidth: false)
    fileprivate let containerView = UIView(backgroundColor: .aSecondarySystemBackground)
    
    override func setup() {
        super.setup()
        containerView.do {
            _addSubview($0)
            $0.fillSuperview(padding: ._init(allEdges: 5))
            $0.viewCornerRadius = 5
            $0.addSubview(nameLabel)
        }
        nameLabel.do {
            $0.anchor(leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, padding: ._init(leftRight: 15))
            $0.centerYInSuperview()
        }
    }
    
    func configure(_ categoory: MovieCategory) {
        nameLabel.text = categoory.rawValue.capitalized
    }
    
    func activate(_ activate: Bool = true) {
        containerView.backgroundColor = activate ? .primaryColor : .aSecondarySystemBackground
        nameLabel.textColor = activate ? .white : .aLabel
    }
    
}
