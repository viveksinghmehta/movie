//
//  APIService.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import Alamofire
import Reachability
import Foundation


enum AppPaths: String, CaseIterable {
    case popularMovies = "popular"
    case topRatedMovies = "top_rated"
    case getMovieDetails = ""
    case videos = "videos"
}


enum ApiRouter {
    
    case popularMovies(page: Int)
    case topRatedMovies(page: Int)
    case getMoviesDetail(id: Int)
    case videos(id: Int)

     var method: HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        case .topRatedMovies:
            return .get
        case .getMoviesDetail:
            return .get
        case .videos:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return AppConstants.baseURL + AppPaths.popularMovies.rawValue
        case .topRatedMovies:
            return AppConstants.baseURL + AppPaths.topRatedMovies.rawValue
        case .getMoviesDetail(let id):
            return AppConstants.baseURL + "\(id)"
        case .videos(let id):
            return AppConstants.baseURL + "\(id)/" + AppPaths.videos.rawValue
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .popularMovies(let page):
            return [ StringConstants.apiKey: AppConstants.apiKey,
                     StringConstants.language: "en-US",
                     StringConstants.page: page ]
        case .topRatedMovies(let page):
            return [ StringConstants.apiKey: AppConstants.apiKey,
                     StringConstants.language: "en-US",
                     StringConstants.page: page ]
        case .getMoviesDetail:
            return [ StringConstants.apiKey: AppConstants.apiKey,
                     StringConstants.language: "en-US" ]
        case .videos:
            return [ StringConstants.apiKey: AppConstants.apiKey,
                     StringConstants.language: "en-US" ]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .popularMovies:
            return URLEncoding.queryString
        case .topRatedMovies:
            return URLEncoding.queryString
        case .getMoviesDetail:
            return URLEncoding.queryString
        case .videos:
            return URLEncoding.queryString
        }
    }
    
    
}

class APIService {

    static let shared = APIService()
    private let reachability = try! Reachability()
    
    private init() {}

    
    func networkRequest<T: Codable>(router: ApiRouter, model: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        if reachability.connection == .wifi || reachability.connection == .cellular {
            AF.request(router.path, method: router.method, parameters: router.parameters, encoding: router.encoding, headers: nil).responseData { [weak self] (response) in
                guard let weakself = self else { return }
                switch response.result {
                case .success(let jsonData):
                    weakself.decodeTheModel(responseData: jsonData, completion: completion)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            
        } else {
            completion(.failure(NetworkError.noInternet))
        }
    }
    
    private func decodeTheModel<T: Codable>(responseData: Data, completion: @escaping(Result<T, Error>) -> Void) {
        let decoder = JSONDecoder()
        do {
            let value = try decoder.decode(T.self, from: responseData)
            completion(.success(value))
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
    }
}

