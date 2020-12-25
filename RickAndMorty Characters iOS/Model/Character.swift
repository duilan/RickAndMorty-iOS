//
//  Character.swift
//  RickAndMorty Characters iOS
//
//  Created by Adrian Cortes on 21/12/20.
//

struct Characters: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
    
    init(id: Int, name: String, status: String, species: String, image: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.image = image
    }
}


/*
 Example
 https://rickandmortyapi.com/api/character
 {
   "info": {
     "count": 671,
     "pages": 34,
     "next": "https://rickandmortyapi.com/api/character?page=2",
     "prev": null
   },
   "results": [
     {
       "id": 1,
       "name": "Rick Sanchez",
       "status": "Alive",
       "species": "Human",
       "type": "",
       "gender": "Male",
       "origin": {
         "name": "Earth (C-137)",
         "url": "https://rickandmortyapi.com/api/location/1"
       },
       "location": {
         "name": "Earth (Replacement Dimension)",
         "url": "https://rickandmortyapi.com/api/location/20"
       },
       "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
       "episode": [
         "https://rickandmortyapi.com/api/episode/1",
         "https://rickandmortyapi.com/api/episode/41"
       ],
       "url": "https://rickandmortyapi.com/api/character/1",
       "created": "2017-11-04T18:48:46.250Z"
     }
   ]
 }*/
