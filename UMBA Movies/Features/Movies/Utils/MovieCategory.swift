//
//  MovieCategory.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 07/02/2022.
//

import Foundation
import RealmSwift

enum MovieCategory: String, CaseIterable, PersistableEnum {
    case latest, popular, upcoming
}
