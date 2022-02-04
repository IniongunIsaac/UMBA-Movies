//
//  DependencyContainer.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
//

import Foundation
import Swinject

struct DependencyContainer {
    
    static func configure(using container: Container) {
        CommonDependencyContainer.configure(using: container)
        MoviesDependencyContainer.configure(using: container)
    }
    
}

extension Container {
    var moviesController: MoviesViewController { resolve(MoviesViewController.self)! }
}
