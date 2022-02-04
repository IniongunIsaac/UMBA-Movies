//
//  BaseCollectionView.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
//

import UIKit

class BaseCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    convenience init(reuseIdentifier: String, cell: UICollectionViewCell.Type, collectionViewLayout: UICollectionViewLayout? = nil, size: CGSize? = nil, direction: UICollectionView.ScrollDirection = .vertical, backgroundColor: UIColor = .clear, showsHorizontalScrollIndicator: Bool = false, showsVerticalScrollIndicator: Bool = false, interitemSpacing: CGFloat = 10, lineSpacing: CGFloat = 10, height: CGFloat? = nil, delegate: UICollectionViewDelegate? = nil, dataSource: UICollectionViewDataSource? = nil) {
        
        self.init(frame: .zero, collectionViewLayout: collectionViewLayout ?? UICollectionViewFlowLayout(direction: direction, size: size, interitemSpacing: interitemSpacing, lineSpacing: lineSpacing))
        self.register(cell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.backgroundColor = backgroundColor
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        if let delegate = delegate {
            self.delegate = delegate
        }
        if let dataSource = dataSource {
            self.dataSource = dataSource
        }
        
        if let height = height {
            constraintHeight(constant: height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UICollectionViewFlowLayout {
    convenience init(direction: UICollectionView.ScrollDirection = .vertical, size: CGSize? = nil, interitemSpacing: CGFloat = 10, lineSpacing: CGFloat = 10) {
        self.init()
        scrollDirection = direction
        if let size = size {
            estimatedItemSize = size
        }
        minimumInteritemSpacing = interitemSpacing
        minimumLineSpacing = lineSpacing
    }
}
