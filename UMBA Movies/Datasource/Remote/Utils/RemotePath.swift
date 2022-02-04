//
//  RemotePath.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation

enum RemotePath {
    case latest, popular, upcoming
    case detail(id: Int)
    
    var path: String {
        switch self {
        case .latest:
            return "now_playing"
        case .popular:
            return "popular"
        case .upcoming:
            return "upcoming"
        case .detail(let id):
            return "\(id)"
        }
    }
    
    var requestURL: String { "\(Bundle.main.baseURL)\(path)" }
}
