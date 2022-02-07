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
    var movieDetailsHandler: ((MovieDetail) -> Void)? = nil
    
    fileprivate var preference: IPreference
    fileprivate let moviesRemote: IMoviesRemoteDatasource
    fileprivate let moviesLocal: IMoviesLocalDatasource
    fileprivate var hasFetchedMoviesFromRemote = false
    
    init(preference: IPreference, moviesRemote: IMoviesRemoteDatasource, moviesLocal: IMoviesLocalDatasource) {
        self.preference = preference
        self.moviesRemote = moviesRemote
        self.moviesLocal = moviesLocal
    }
    
    func getMovies() {
        subscribe(moviesLocal.getMovies(), success: { [weak self] movies in
            guard let self = self else { return }
            let latestMovies = movies.filter { $0.category == .latest }.map { $0.movie }
            let popularMovies = movies.filter { $0.category == .popular }.map { $0.movie }
            let upcomingMovies = movies.filter { $0.category == .upcoming }.map { $0.movie }
            self.movieListsHandler?((latestMovies, popularMovies, upcomingMovies))
            if !self.hasFetchedMoviesFromRemote {
                self.getRemoteMovies()
            }
        })
    }
    
    fileprivate func getRemoteMovies() {
        subscribe(Observable.zip(moviesRemote.getMovies(category: .latest), moviesRemote.getMovies(category: .popular), moviesRemote.getMovies(category: .upcoming)), success: { [weak self] movieResponse in
            self?.hasFetchedMoviesFromRemote = true
            let latestMovies = movieResponse.0.movies ?? []
            let popularMovies = movieResponse.1.movies ?? []
            let upcomingMovies = movieResponse.2.movies ?? []
            self?.movieListsHandler?((latestMovies, popularMovies, upcomingMovies))
            let dbMovies = latestMovies.map { $0.dbMovie(category: .latest) } + popularMovies.map { $0.dbMovie(category: .popular) } + upcomingMovies.map { $0.dbMovie(category: .upcoming) }
            self?.saveMovies(dbMovies)
        })
    }
    
    fileprivate func saveMovies(_ movies: [DBMovie]) {
        subscribe(moviesLocal.saveMovies(movies))
    }
    
    func getMovieDetails(id: Int) {
        subscribe(moviesRemote.getMovieDetails(id: id), success: { [weak self] movieDetail in
            self?.movieDetailsHandler?(movieDetail)
        })
    }
    
}
