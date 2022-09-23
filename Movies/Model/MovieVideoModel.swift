//
//  MovieVideoModel.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 23/09/22.
//

import Foundation


struct MovieVideoResponse: Codable {
    var id: Int?
    var results: [MovieVideoModel]?
}


struct MovieVideoModel: Codable {
    var id: String?
    var name: String?
    var key: String?
    var site: String?
    var type: String?
    var official: Bool?
    
    var videoURL: URL? {
        guard let url = URL(string: AppConstants.youtubeURL + (key ?? "")) else {
            return nil
        }
        return url
    }
}
