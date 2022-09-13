//
//  HomeCellViewModel.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 25/08/22.
//

import Foundation

protocol HomeCellViewModelProtocol: AnyObject {
    func sucess()
}

class HomeCellViewModel {
    
    private var pokemon: Pokemon
    private var pokemonDetail: PokemonDetail?
    private var service = Service()
    private weak var delegate: HomeCellViewModelProtocol?
    
    init(pokemon: Pokemon, delegate: HomeCellViewModelProtocol){
        self.delegate = delegate
        self.pokemon = pokemon
    }

    public func buscarPokemonDetail(){
        let net = NetworkRequest(endpointURL: pokemon.url)
        service.request(net) { (result: Result<PokemonDetail, NetworkError>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonDetail = success
                    self.delegate?.sucess()
                }
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
    
    public func getPokemonName() -> String {
        return self.pokemon.name.capitalized
    }
    
    public func getPokemonImage() -> String {
        return self.pokemonDetail?.sprites.other.officialArtwork.front_default ?? ""
    }
    
    public func getPokemonTipe() -> String {
        return self.pokemonDetail?.types[0].type.name ?? ""
    }
    
    public func getPokemonId() -> String {
        guard let pokemonDetail = pokemonDetail else { return ""}
        let pokeNumber = pokemonDetail.id
        return String(format: "#%03d", pokeNumber)
    }
    
    public func getPokemonTipe2() -> String {
        if self.pokemonDetail?.types.count == 2 {
            return self.pokemonDetail?.types[1].type.name ?? ""
        }else {
            return ""
        }
    }
    
}
