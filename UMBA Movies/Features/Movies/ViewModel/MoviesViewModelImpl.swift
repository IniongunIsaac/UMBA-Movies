//
//  MoviesViewModelImpl.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation

class MoviesViewModelImpl: BaseViewModel, IMoviesViewModel {
    
    
    var preference: IPreference
    fileprivate let moviesRemote: IMoviesRemoteDatasource
    
    init(preference: IPreference, moviesRemote: IMoviesRemoteDatasource) {
        self.preference = preference
        self.moviesRemote = moviesRemote
    }
    
}
