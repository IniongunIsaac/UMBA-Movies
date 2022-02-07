//
//  MoviesView.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import UIKit

class MoviesView: BaseView {
    
    fileprivate let CATEGORY_CELL_ID = "CategoryCollectionViewCell"
    fileprivate let categories = MovieCategory.allCases
    fileprivate var selectedCategory: MovieCategory = .latest

    fileprivate let categoriesLabel = UILabel(text: "Categories", alignment: .left)
    fileprivate lazy var categoriesCollectionView: UICollectionView = {
        BaseCollectionView(reuseIdentifier: CATEGORY_CELL_ID, cell: CategoryCollectionViewCell.self, size: UICollectionViewFlowLayout.automaticSize, direction: .horizontal, interitemSpacing: 15, height: 45, delegate: self, dataSource: self).apply {
            $0.clipsToBounds = false
        }
    }()
    
    override func setup() {
        super.setup()
        addSubviews(categoriesLabel, categoriesCollectionView)
        categoriesLabel.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 10, left: 20, right: 20))
        categoriesCollectionView.anchor(top: categoriesLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 10, left: 15, right: 15))
    }

}

extension MoviesView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        (collectionView.dequeueReusableCell(withReuseIdentifier: CATEGORY_CELL_ID, for: indexPath) as! CategoryCollectionViewCell).apply {
            let category = categories[indexPath.item]
            $0.configure(category)
            $0.activate(selectedCategory == category)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.item]
        categoriesCollectionView.reloadData()
    }
}
