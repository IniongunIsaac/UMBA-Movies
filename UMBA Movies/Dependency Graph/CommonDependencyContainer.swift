//
//  CommonDependencyContainer.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
//

import Foundation
import Swinject

struct CommonDependencyContainer {
    
    static func configure(using container: Container) {
        container.register(IPreference.self) { _ in PreferenceImpl() }
    }
    
}
