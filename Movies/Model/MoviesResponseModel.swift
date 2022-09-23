//
//  MoviesResponseModel.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 22/09/22.
//

import Foundation

struct MoviesResponseModel: Codable {
    var page: Int?
    var results: [MovieModel]?
    var totalPages: Int?
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
