//
//  TopRatedMoviesViewModel.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 23/09/22.
//

import Foundation

@MainActor
class TopRatedMoviesViewModel: ObservableObject {
    
    @Published var movies = [MovieModel]()
    var page: Int = 1
    var totalPages: Int = 0
    
    init() {
       fetchPopularMovies(page: page)
    }
    
    fileprivate func fetchPopularMovies(page: Int = 1) {
        APIService.shared.networkRequest(router: .topRatedMovies(page: page), model: MoviesResponseModel.self) { [weak self] response in
            guard let weakself = self else { return }
            switch response {
            case .success(let movies):
                weakself.checkForValuesAndAddMovies(movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadMoreContent(currentMovie movie: MovieModel) {
        let thresholdIndex = self.movies.index(self.movies.endIndex, offsetBy: -1)
        if (page + 1) <= totalPages {
            page += 1
            fetchPopularMovies(page: page)
        }
    }
    
    func checkForValuesAndAddMovies(_ model: MoviesResponseModel) {
        guard let movies = model.results else {return }
        totalPages = model.totalPages ?? 0
        if self.movies.isEmpty {
            self.movies = movies
        } else {
            self.movies.append(contentsOf: movies)
        }
    }
    
}
