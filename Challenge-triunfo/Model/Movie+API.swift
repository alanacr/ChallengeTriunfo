//
//  Movie+API.swift
//  FilmADA
//
//  Created by Francisco Soares Neto on 13/07/22.
//

import Foundation

extension Movie {
    
    static let urlComponents = URLComponents (string: "https://api.themoviedb.org/")!
    
    static func popularMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/movie/popular"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let sessions = URLSession.shared
        
        do {
            let (data, response) = try await sessions.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        } catch {
            print (error)
        }
        
        return []
    }
    
    // MARK: - now playing api
    
    static func nowPlayingAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/movie/now_playing"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let sessions = URLSession.shared
        
        do {
            let (data, response) = try await sessions.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        } catch {
            print (error)
        }
        
        return []
    }
    
    // MARK: - upcoming
    
    static func upcomingAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/movie/upcoming"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let sessions = URLSession.shared
        
        do {
            let (data, response) = try await sessions.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        } catch {
            print (error)
        }
        
        return []
    }
    // MARK: - Download das imagens
    
    static func downloadImageData(withPath: String) async -> Data {
        let urlString = "https://image.tmdb.org/t/p/w780\(withPath)"
        //https://image.tmdb.org/t/p/w500
        let url: URL = URL (string: urlString)!
        
        let session = URLSession.shared
        
        do{
            let (data, response) = try await session.data (from: url)
            return data
        } catch {
            print(error)
        }
        
        return Data ()
        
    }
    
    //MARK: - Download de trendings do dia
    static func trendingTodayMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/trending/movie/day"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey),
            URLQueryItem(name: "language", value: "pt-BR")
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            
            return movieResult.results
        } catch {
            print(error)
        }
        return []
    }
    
    //MARK: - Download de trendings da semana
    static func trendingWeekMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/trending/movie/week"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey),
            URLQueryItem(name: "language", value: "pt-BR")
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            
            return movieResult.results
        } catch {
            print(error)
        }
        return []
    }
    
    // MARK: - Recuperando a chave da API de um arquivo
    static var apiKey: String {
        guard let url = Bundle.main.url(forResource: "TMDB-Info", withExtension: "plist") else {
            fatalError("Couldn't find api key configuration file.")
        }
        guard let plist = try? NSDictionary(contentsOf: url, error: ()) else {
            fatalError("Couldn't interpret api key configuration file as plist.")
        }
        guard let key = plist["API_KEY"] as? String else {
            fatalError("Couldn't find an api key in its configuration file.")
        }
        return key
    }
    // MARK: SEARCH
    static func searchMovieAPI(title: String) async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = "/3/search/movie"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey),
            URLQueryItem(name: "query", value: title)
        ]
        
        let sessions = URLSession.shared
        
        do {
            let (data, response) = try await sessions.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        } catch {
            print (error)
        }
        
        return []
    }
}


