//
//  IMoviesLocalDatasource.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 07/02/2022.
//

import Foundation
import RxSwift

protocol IMoviesLocalDatasource {
    func getMovies() -> Observable<[DBMovie]>
    
    func saveMovies(_ movies: [DBMovie]) -> Observable<Void>
}
