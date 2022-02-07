//
//  MoviesViewModelImpl.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation
import RxSwift

class MoviesViewModelImpl: BaseViewModel, IMoviesViewModel {
    
    var movieListsHandler: ((MovieLists) -> Void)? = nil
    
    var preference: IPreference
    fileprivate let moviesRemote: IMoviesRemoteDatasource
    
    init(preference: IPreference, moviesRemote: IMoviesRemoteDatasource) {
        self.preference = preference
        self.moviesRemote = moviesRemote
    }
    
    func getMovies() {
        subscribe(Observable.zip(moviesRemote.getMovies(category: .latest), moviesRemote.getMovies(category: .popular), moviesRemote.getMovies(category: .upcoming)), success: { [weak self] movieResponse in
            self?.movieListsHandler?((movieResponse.0.movies ?? [], movieResponse.1.movies ?? [], movieResponse.2.movies ?? []))
        })
    }
    
}
