//
//  IMoviesViewModel.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation

protocol IMoviesViewModel {
    
    var movieListsHandler: ((MovieLists) -> Void)? { get set }
    
    var movieDetailsHandler: ((MovieDetail) -> Void)? { get set }
    
    var internetConnectivityHandler: ((Bool) -> Void)? { get set }
    
    func getMovies()
    
    func getRemoteMovies()
    
    func getMovieDetails(id: Int)
    
}
