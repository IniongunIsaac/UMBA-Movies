//
//  MovieResponse.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int?
    let movies: [Movie]?
    let totalResults, totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case page, movies = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
