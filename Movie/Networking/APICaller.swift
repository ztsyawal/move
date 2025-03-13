//
//  APICaller.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import Foundation
import UIKit
import Moya
import Alamofire
import SwiftyJSON

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        if NetworkConstants.shared.apiKey.isEmpty {
            print("<!> API KEY is Missing <!>")
            print("<!> Get One from: https://www.themoviedb.org/ <!>")
            return
        }
        
        let urlString: String = NetworkConstants.shared.serverAddress +
                "trending/all/day?api_key=" +
                NetworkConstants.shared.apiKey

        AF.request(urlString).validate().responseJSON { response in
                guard response.error == nil else {
                    print(response.error!)
                    return
                }
                guard let data = response.data else {
                    print("No Data")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let resultData = try decoder.decode(TrendingMovieModel.self, from: data)
                    completionHandler(.success(resultData))
                } catch {
                   // print(err)
                    completionHandler(.failure(.canNotParseData))
                }
        }
    }
    static func getGenreMovies(completionHandler: @escaping (_ result: Result<GenreMovieModel, NetworkError>) -> Void) {
        if NetworkConstants.shared.apiKey.isEmpty {
            print("<!> API KEY is Missing <!>")
            print("<!> Get One from: https://www.themoviedb.org/ <!>")
            return
        }
        
        let urlString: String = NetworkConstants.shared.serverAddress +
                "genre/movie/list?api_key=" +
                NetworkConstants.shared.apiKey

        AF.request(urlString).validate().responseJSON { response in
                guard response.error == nil else {
                    print(response.error!)
                    return
                }
                guard let data = response.data else {
                    print("No Data")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let resultData = try decoder.decode(GenreMovieModel.self, from: data)
                    completionHandler(.success(resultData))
                } catch {
                   // print(err)
                    completionHandler(.failure(.canNotParseData))
                }
        }
    }
}
