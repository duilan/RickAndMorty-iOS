//
//  Character.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 21/12/20.
//

struct Character {
    let name: String
    let status: String
    let specie: String
    let image: String
    
    init(name: String, status: String, specie: String, image: String) {
        self.name = name
        self.status = status
        self.specie = specie
        self.image = image
    }
    
}
