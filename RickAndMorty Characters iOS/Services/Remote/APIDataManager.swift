//
//  RemoteDataManager.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 23/12/20.
//
import UIKit

class APIDataManager {
    // Singleton
    static let shared = APIDataManager()
    
    private init() {}
    
    private let baseURL = "https://rickandmortyapi.com/api"
    
    // Obtiene los caracteres por paginacion
    func fetchCharacters(numPage: Int, completed: @escaping (Result<Characters,APIError>) -> Void) {
        let endpoint = baseURL + "/character?page=\(numPage)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.invalidRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let safeData = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodeData = try decoder.decode(Characters.self, from: safeData)
                return completed(.success(decodeData))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
