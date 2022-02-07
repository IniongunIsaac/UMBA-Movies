//
//  MoviesViewController.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import UIKit

class MoviesViewController: BaseViewController<MoviesView, IMoviesViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar(title: "Movies", font: .avenirBold(18), barTextColor: .aLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar()
    }
    
    override func configureViews() {
        super.configureViews()
        viewModel.getMovies()
        
        kview.movieSelectionHandler = { [weak self] movie in
            self?.viewModel.getMovieDetails(id: movie.id!)
        }
        
        kview.retryHandler = { [weak self] in
            self?.viewModel.getRemoteMovies()
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        
        viewModel.movieListsHandler = { [weak self] movieLists in
            self?.kview.movieLists = movieLists
        }
        
        viewModel.movieDetailsHandler = { [weak self] movieDetail in
            self?._pushViewController(AppDelegate.dependencyContainer.movieDetailsController.apply {
                $0.movieDetail = movieDetail
            })
        }
        
        viewModel.internetConnectivityHandler = { [weak self] connected in
            self?.kview.hasInternetConnection = connected
        }
    }

}
