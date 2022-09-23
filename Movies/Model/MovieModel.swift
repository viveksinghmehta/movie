//
//  MovieModel.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 23/09/22.
//

import Foundation


let exampleMovie = MovieModel(id: 985939, title: "Fall", posterPath: "/spCAxD99U1A6jsiePFoqdEcY0dG.jpg", language: "en", date: "2022-08-11", voteAverage: 7.4, overview: "For best friends Becky and Hunter, life is all about conquering fears and pushing limits. But after they climb 2,000 feet to the top of a remote, abandoned radio tower, they find themselves stranded with no way down. Now Becky and Hunter’s expert climbing skills will be put to the ultimate test as they desperately fight to survive the elements, a lack of supplies, and vertigo-inducing heights", tag: "Fear reaches new heights.", runtime: 107)

struct MovieModel: Identifiable, Codable {
    var id: Int?
    var adult: Bool?
    var backdropPath: String?
    var genreIds: [Int]?
    var genres: [Genre]?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var tagline: String?
    var runtime: Int?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Double?
    var poster: URL? {
        guard let url = URL(string: AppConstants.imageBaseURL + (posterPath ?? "")) else {
            return nil
        }
        return url
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(id: Int, title: String, posterPath: String, language: String, date: String, voteAverage: Double, overview: String, tag: String, runtime: Int) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.originalLanguage = language
        self.releaseDate = date
        self.voteAverage = voteAverage
        self.overview = overview
        self.tagline = tag
        self.runtime = runtime
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
        self.originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        self.voteCount = try container.decodeIfPresent(Double.self, forKey: .voteCount)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.adult, forKey: .adult)
        try container.encodeIfPresent(self.backdropPath, forKey: .backdropPath)
        try container.encodeIfPresent(self.genreIds, forKey: .genreIds)
        try container.encodeIfPresent(self.originalLanguage, forKey: .originalLanguage)
        try container.encodeIfPresent(self.originalTitle, forKey: .originalTitle)
        try container.encodeIfPresent(self.overview, forKey: .overview)
        try container.encodeIfPresent(self.popularity, forKey: .popularity)
        try container.encodeIfPresent(self.posterPath, forKey: .posterPath)
        try container.encodeIfPresent(self.releaseDate, forKey: .releaseDate)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.video, forKey: .video)
        try container.encodeIfPresent(self.voteAverage, forKey: .voteAverage)
        try container.encodeIfPresent(self.voteCount, forKey: .voteCount)
    }
}


struct Genre: Codable {
    var id: Int?
    var name: String?
}
