//
//  HomeScreenCell.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 25/08/22.
//

import Foundation
import UIKit

class HomeScreenCell: UICollectionViewCell {
    //MARK: - Propriedades
    static let identifier: String = "HomeScreenCell"
    private var viewModel: HomeCellViewModel?
    
    //MARK: - Elementos
    lazy var pokemonCard: PokemonCard = {
        let c = PokemonCard()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.clipsToBounds = true
        return c
    }()
    
    //MARK: - Metodos
    public func configureCell(pokemon: Pokemon){
        self.viewModel = HomeCellViewModel(pokemon: pokemon, delegate: self)
        self.viewModel?.buscarPokemonDetail()
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configurandoViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - HomeCellViewModelProtocol
extension HomeScreenCell: HomeCellViewModelProtocol {
    func sucess() {
        guard let viewModel = self.viewModel else {return}
        self.pokemonCard.pokeName.text = viewModel.getPokemonName()
        self.pokemonCard.pokeId.text = viewModel.getPokemonId()
        self.pokemonCard.pokeImage.loadImage(urlString: viewModel.getPokemonImage())
        self.pokemonCard.containerPokemon.setBackgroundColor(tipe: viewModel.getPokemonTipe())
        self.pokemonCard.tipeImage.image = UIImage(named: viewModel.getPokemonTipe())
        self.pokemonCard.tipeLabel.text = viewModel.getPokemonTipe().capitalized
        self.pokemonCard.tipe2Image.image = UIImage(named: viewModel.getPokemonTipe2())
        self.pokemonCard.tipe2Label.text = viewModel.getPokemonTipe2().capitalized
    }

}

//MARK: - Configurando ViewCode
extension HomeScreenCell: ViewCode {
    func addViewCode() {
        self.contentView.addSubview(pokemonCard)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.pokemonCard.topAnchor.constraint(equalTo: self.topAnchor),
            self.pokemonCard.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.pokemonCard.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.pokemonCard.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func additionalConfig() {
        
    }
    
}
