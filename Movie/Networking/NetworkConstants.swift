//
//  NetworkConstants.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var apiKey: String {
        get {
            //https://www.themoviedb.org/
            //Put your own API key here
            return "27bf06a805d8c83f662dd3ca996e7cbf"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
