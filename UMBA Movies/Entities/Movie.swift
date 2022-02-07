//
//  Movie.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import Foundation
import RealmSwift

struct Movie: Codable, Scopable {
    let id: Int?
    let posterPath: String?
    let title: String?
    let releaseDate: String?
    let voteCount: Int?
    
    var posterURL: String { "\(Bundle.main.imagesBaseURL)\(posterPath!)" }

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case id
        case title
        case voteCount = "vote_count"
    }
    
    func dbMovie(category: MovieCategory) -> DBMovie {
        DBMovie(id: id, posterPath: posterPath, title: title, releaseDate: releaseDate, voteCount: voteCount, category: category)
    }
}


class DBMovie: Object {
    @Persisted(primaryKey: true) var movieId: Int
    @Persisted var posterPath: String?
    @Persisted var title: String?
    @Persisted var releaseDate: String?
    @Persisted var voteCount: Int?
    @Persisted var category: MovieCategory?
    
    var movie: Movie {
        Movie(id: movieId, posterPath: posterPath, title: title, releaseDate: releaseDate, voteCount: voteCount)
    }
    
    convenience init(id: Int?, posterPath: String?, title: String?, releaseDate: String?, voteCount: Int?, category: MovieCategory) {
        self.init()
        movieId = id!
        self.posterPath = posterPath
        self.title = title
        self.releaseDate = releaseDate
        self.voteCount = voteCount
        self.category = category
    }
}
