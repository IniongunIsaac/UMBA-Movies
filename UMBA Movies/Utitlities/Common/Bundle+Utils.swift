//
//  Bundle+Utils.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import UIKit

extension Bundle {
    
    func value<T>(for key: String) -> T? {
        object(forInfoDictionaryKey: key) as? T
    }
    
    var baseURL: String { value(for: "BASE_URL")! }
    
    var apiKey: String { value(for: "API_KEY")! }
    
    var imagesBaseURL: String { value(for: "IMAGES_BASE_URL")! }
    
}
