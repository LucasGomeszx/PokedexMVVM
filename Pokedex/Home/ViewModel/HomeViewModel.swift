//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 25/08/22.
//

import Foundation

protocol HomeViewModelProtocol:AnyObject {
    func successResult()
    func failureResult(error: String)
}

class HomeViewModel {
    //MARK: - Pripriedades
    
    private let service: Service = Service()
    private var pokemonList: PokemonList = PokemonList(results: [])
    private var pokemonListFilter: PokemonList = PokemonList(results: [])
    private weak var delegate: HomeViewModelProtocol?

    //MARK: - Init
    init(delegate: HomeViewModelProtocol){
        self.delegate = delegate
    }
    
    //MARK: - Metodos
    public func getPokemons(){
        
        let net = NetworkRequest(endpointURL: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")
        service.request(net) { (result: Result<PokemonList, NetworkError>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonList = success
                    self.pokemonListFilter = self.pokemonList
                    self.delegate?.successResult()
                }
            case .failure(let failure):
                DispatchQueue.main.async {
                    self.delegate?.failureResult(error: failure.localizedDescription)
                }
            }
        }
        
    }
    
    public func filtrarPokemon(text: String){
        self.pokemonListFilter.results = []
        
        if text.isEmpty{
            self.pokemonListFilter = self.pokemonList
        }else{
            for value in pokemonList.results{
                if value.name.uppercased().contains(text.uppercased()){
                    self.pokemonListFilter.results.append(value)
                }
            }
        }
        
    }
    
    public func cancellTapped(){
        self.pokemonListFilter = self.pokemonList
    }

    //MARK: - Getter
    public var getPokeCount:Int {
        return self.pokemonListFilter.results.count
    }
    
    public func getPokemon(index: IndexPath) -> Pokemon {
        return self.pokemonListFilter.results[index.row]
    }
    
}
