//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 30/08/22.
//

import Foundation
protocol DetailViewModelProtocol: AnyObject {
    func sucessRequest()
    func failureRequest(error:String)
}

class DetailViewModel {
    //MARK: - Propriedades
    private var service: Service = Service()
    private var pokemon: Pokemon
    private var pokemonDetail: PokemonDetail?
    private weak var delegate: DetailViewModelProtocol?
    
    //MARK: - Init
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    public func configurarDelegate(delegate: DetailViewModelProtocol) {
        self.delegate = delegate
    }
    
    //MARK: - Metodos
    func getPokemonDetail() {
        let net = NetworkRequest(endpointURL: self.pokemon.url)
        service.request(net) { (result: Result<PokemonDetail, NetworkError>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonDetail = success
                    self.delegate?.sucessRequest()
                }
            case .failure(let failure):
                DispatchQueue.main.async {
                    self.delegate?.failureRequest(error: failure.localizedDescription)
                }
            }
        }
        
    }
    
    //MARK: - Getter
    public func getPokemonName() -> String {
        return self.pokemon.name.capitalized
    }
    
    public func getPokemonImage() -> String {
        return self.pokemonDetail?.sprites.other.officialArtwork.front_default ?? ""
    }
    
    public func getPokemonTipe() -> String {
        return self.pokemonDetail?.types[0].type.name ?? ""
    }
    
    public func getPokemonTipe2() -> String {
        if self.pokemonDetail?.types.count == 2 {
            return self.pokemonDetail?.types[1].type.name ?? ""
        }else {
            return ""
        }
    }
    
    public func getPokemonId() -> String {
        guard let pokemonDetail = pokemonDetail else { return ""}
        let pokeNumber = pokemonDetail.id
        return String(format: "#%03d", pokeNumber)
    }
    
    public func getPokemonHeight() -> String {
        return String("Height: \(self.pokemonDetail!.height)")
    }
    
    public func getPokemonWeight() -> String {
        return String("Weight: \(self.pokemonDetail!.weight)")
    }
    
    public func getPokemonHp() -> Int {
        return self.pokemonDetail?.stats[0].base_stat ?? 0
    }
    
    public func getPokemonAtk() -> Int {
        return self.pokemonDetail?.stats[1].base_stat ?? 0
    }
    
    public func getPokemonDef() -> Int {
        return self.pokemonDetail?.stats[2].base_stat ?? 0
    }
    
    public func getPokemonSpA() -> Int {
        return self.pokemonDetail?.stats[3].base_stat ?? 0
    }
    
    public func getPokemonSpD() -> Int {
        return self.pokemonDetail?.stats[4].base_stat ?? 0
    }
    
    public func getPokemonSpeed() -> Int {
        return self.pokemonDetail?.stats[5].base_stat ?? 0
    }
    
}
