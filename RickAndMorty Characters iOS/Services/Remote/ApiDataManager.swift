//
//  RemoteDataManager.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 23/12/20.
//
import UIKit

class ApiDataManager {
    // Singleton
    static let shared = ApiDataManager()
    
    let baseURL = "https://rickandmortyapi.com/api"
    
    // Obtiene los caracteres por paginacion
    func fetchCharacters(numPage: Int, completed: @escaping (Characters) -> Void) {
        // conforma url de characters por pagina
        let url = URL(string: "\(baseURL)/character?page=\(numPage)")!
        // realiza peticion http
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // verificamos error
            if let e = error {
                print("Error with fetching: \(e)")
                return
            }
            // verificamos data
            guard let safeData = data else {
                print("Error with fetching data")
                return
            }
            
            // se hace decode de datos JSON
            do {
                let decoder = JSONDecoder()
                let decodeData = try decoder.decode(Characters.self, from: safeData)
                return completed(decodeData)
            } catch {
                print("Error parsing JSON \(error)")
            }
        }
        task.resume()
    }
    
}
