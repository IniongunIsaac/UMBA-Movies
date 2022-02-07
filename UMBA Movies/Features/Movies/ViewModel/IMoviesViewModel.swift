//
//  IMoviesViewModel.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation

protocol IMoviesViewModel {
    
    var movieListsHandler: ((MovieLists) -> Void)? { get set }
    
    func getMovies()
    
}
