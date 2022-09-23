//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 23/09/22.
//

import Foundation

@MainActor
class MovieDetailsViewModel: ObservableObject {
    
    @Published var movieVideos = [MovieVideoModel]()
    
    init() {
        
    }
    
    func fetchVideos(id: Int) {
        APIService.shared.networkRequest(router: .videos(id: id), model: MovieVideoResponse.self) { [weak self] response in
            guard let weakself = self else { return }
            switch response {
            case .success(let model):
                if let videos = model.results {
                    weakself.movieVideos = videos
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
