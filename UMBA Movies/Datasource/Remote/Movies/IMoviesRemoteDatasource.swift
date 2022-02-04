//
//  IMoviesRemoteDatasource.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation
import RxSwift

protocol IMoviesRemoteDatasource {
    
    func getMovieDetails(id: Int) -> Observable<MovieDetail>
    
    func getMovies(category: RemotePath) -> Observable<MovieResponse>
    
}
