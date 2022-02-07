//
//  MoviesLocalDatasourceImpl.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 07/02/2022.
//

import Foundation
import RxSwift
import RealmSwift

class MoviesLocalDatasourceImpl: BaseLocalDatasource, IMoviesLocalDatasource {
    
    let realm: Realm
        
    init(realm: Realm) {
        self.realm = realm
    }
    
    override var kRealm: Realm { realm }
    
    func getMovies() -> Observable<[DBMovie]> {
        getAll(obj: DBMovie.self)
    }
    
    func saveMovies(_ movies: [DBMovie]) -> Observable<Void> {
        insert(objs: movies)
    }
    
}
