//
//  MoviesDependencyContainer.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation
import Swinject

struct MoviesDependencyContainer {
    
    static func configure(using container: Container) {
        
        container.register(IMoviesRemoteDatasource.self) { _ in MoviesRemoteDatasourceImpl() }
        
        container.register(IMoviesViewModel.self) { MoviesViewModelImpl(preference: $0.resolve(IPreference.self)!, moviesRemote: $0.resolve(IMoviesRemoteDatasource.self)!, moviesLocal: $0.resolve(IMoviesLocalDatasource.self)!) }
        
        container.register(MoviesViewController.self) { MoviesViewController(viewModel: $0.resolve(IMoviesViewModel.self)!) }
        
        container.register(MovieDetailsViewController.self) { MovieDetailsViewController(viewModel: $0.resolve(IMoviesViewModel.self)!) }
        
    }
    
}
