//
//  MoviesView.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import UIKit

typealias MovieLists = (latest: [Movie], popular: [Movie], upcoming: [Movie])

class MoviesView: BaseView {
    
    var movieSelectionHandler: ((Movie) -> Void)?
    var retryHandler: NoParamHandler?
    fileprivate let CATEGORY_CELL_ID = "CategoryCollectionViewCell"
    fileprivate let MOVIE_CELL_ID = "MovieCollectionViewCell"
    fileprivate let categories = MovieCategory.allCases
    fileprivate var selectedCategory: MovieCategory = .latest {
        didSet {
            refreshMovies()
        }
    }
    var movieLists = MovieLists([], [], []) {
        didSet {
            refreshMovies()
        }
    }
    fileprivate var movies: [Movie] {
        switch selectedCategory {
        case .latest:
            return movieLists.latest
        case .popular:
            return movieLists.popular
        case .upcoming:
            return movieLists.upcoming
        }
    }

    fileprivate let categoriesLabel = UILabel(text: "Categories", alignment: .left)
    fileprivate lazy var categoriesCollectionView: UICollectionView = {
        BaseCollectionView(reuseIdentifier: CATEGORY_CELL_ID, cell: CategoryCollectionViewCell.self, size: UICollectionViewFlowLayout.automaticSize, direction: .horizontal, interitemSpacing: 15, height: 45, delegate: self, dataSource: self).apply {
            $0.clipsToBounds = false
        }
    }()
    fileprivate lazy var moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout(direction: .vertical, interitemSpacing: 0, lineSpacing: 20)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 30, height: 340)
        return UICollectionView(frame: .zero, collectionViewLayout: layout) .apply {
            $0.delegate = self
            $0.dataSource = self
            $0.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MOVIE_CELL_ID)
            $0.showsVerticalScrollIndicator = false
        }
    }()
    fileprivate let noInternetContainerView = UIView(backgroundColor: .clear)
    fileprivate let noInternetIconImageView = UIImageView(image: R.image.no_wifi_icon(), tintColor: .aSecondaryLabel, size: 60)
    fileprivate let noInternetLabel = UILabel(text: "No internet connection!", font: .avenirRegular(16), numberOfLines: 0)
    fileprivate lazy var retryButton: ACButton = {
        ACButton(title: "Retry", height: 40, width: 120, tapAction: handleRetryButtonTapped)
    }()
    fileprivate lazy var noInternetStackview: VerticalStackView = {
        VerticalStackView(arrangedSubviews: [noInternetIconImageView, noInternetLabel, retryButton], spacing: 20, alignment: .center)
    }()
    var hasInternetConnection: Bool = true {
        didSet {
            [categoriesLabel, categoriesCollectionView, moviesCollectionView].showViews(hasInternetConnection)
            noInternetContainerView.showView(!hasInternetConnection)
        }
    }
    
    override func setup() {
        super.setup()
        addSubviews(categoriesLabel, categoriesCollectionView, moviesCollectionView, noInternetContainerView)
        categoriesLabel.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 10, left: 20, right: 20))
        categoriesCollectionView.anchor(top: categoriesLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 10, left: 15, right: 15))
        moviesCollectionView.anchor(top: categoriesCollectionView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: ._init(top: 20, left: 15, bottom: 20, right: 15))
        noInternetContainerView.do {
            $0.fillSuperview()
            $0.addSubview(noInternetStackview)
        }
        noInternetStackview.centerInSuperview()
        
        refreshMovies()
        
    }
    
    fileprivate func refreshMovies() {
        moviesCollectionView.do {
            if movies.isEmpty {
                $0.setNoValuesFoundBackgroundMessage("\(selectedCategory.rawValue.capitalized) movies not available!")
            } else {
                $0.removeBackgroundView()
            }
            $0.reloadData()
            $0.setContentOffset(.zero, animated: true)
        }
    }

}

extension MoviesView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView == categoriesCollectionView ? categories.count : movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            return (collectionView.dequeueReusableCell(withReuseIdentifier: CATEGORY_CELL_ID, for: indexPath) as! CategoryCollectionViewCell).apply {
                let category = categories[indexPath.item]
                $0.configure(category)
                $0.activate(selectedCategory == category)
            }
        } else {
            return (collectionView.dequeueReusableCell(withReuseIdentifier: MOVIE_CELL_ID, for: indexPath) as! MovieCollectionViewCell).apply {
                $0.configure(movies[indexPath.item])
                $0.addClearBackground()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
            selectedCategory = categories[indexPath.item]
            categoriesCollectionView.reloadData()
        } else {
            movieSelectionHandler?(movies[indexPath.item])
        }
    }
    
    fileprivate func handleRetryButtonTapped() {
        retryHandler?()
    }
    
}
