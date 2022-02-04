//
//  MoviesRemoteDatasourceImpl.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation
import RxSwift

class MoviesRemoteDatasourceImpl: BaseRemoteDatasource, IMoviesRemoteDatasource {
    
    func getMovieDetails(id: Int) -> Observable<MovieDetail> {
        makeAPIRequest(path: .detail(id: id), responseType: MovieDetail.self)
    }
    
    func getMovies(category: RemotePath) -> Observable<MovieResponse> {
        makeAPIRequest(path: category, responseType: MovieResponse.self)
    }
    
}
