//
//  CommonDependencyContainer.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
//

import Foundation
import Swinject
import RealmSwift

struct CommonDependencyContainer {
    
    static func configure(using container: Container) {
        container.register(IPreference.self) { _ in PreferenceImpl() }
        
        container.register(Realm.self) { _ in try! Realm() }
        
        container.register(IMoviesLocalDatasource.self) { res in MoviesLocalDatasourceImpl(realm: res.resolve(Realm.self)!) }
    }
    
}
