//
//  Pokemon.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 30/08/22.
//

import Foundation

struct PokemonList: Decodable {
    
    var results : [Pokemon]
    
}

struct Pokemon: Decodable {
    
    let name: String
    let url: String
    
}
