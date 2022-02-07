//
//  MovieDetailsViewController.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import UIKit

class MovieDetailsViewController: BaseViewController<MovieDetailsView, IMoviesViewModel> {
    
    var movieDetail: MovieDetail!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar(false)
    }
    
    override func addSubviewConstraints() {
        kview.anchor(top: topAnchor, leading: safeAreaLeadingAnchor, bottom: safeAreaBottomAnchor, trailing: safeAreaTrailingAnchor)
    }
    
    override func configureViews() {
        super.configureViews()
        kview.showDetails(movieDetail)
        kview.popHandler = { [weak self] in
            self?._popViewController()
        }
    }

}
