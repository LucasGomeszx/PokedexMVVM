//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 25/08/22.
//

import Foundation

struct PokemonDetail: Decodable {
    
    let sprites: Sprites
    let id: Int
    let types: [Tipos]
    let name: String
    let height: Int
    let weight: Int
    let stats: [Estatos]
    
}

struct Sprites: Decodable {
    let other: Other
}

struct Other: Decodable {
    let officialArtwork: Dream

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct Dream: Decodable {
    let front_default: String
}

struct Tipos: Decodable {
    let slot: Int
    let type: Species
}

struct Species: Decodable {
    let name: String
}

struct Estatos: Decodable {
    let base_stat: Int
    let stat: Stat
}

struct Stat: Decodable {
    let name: String
}
