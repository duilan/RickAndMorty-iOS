//
//  APIError.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 14/01/21.
//

enum APIError: String, Error {
    case invalidRequest = "Unable to complete your request. Please check your internet connection"
    case invalidURL = "The URL is invalid. Please try again."
    case invalidResponse  = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
}
