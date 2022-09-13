//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 30/08/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    //MARK: - Propriedades
    private var viewModel: DetailViewModel?
    private var screen: DetailScreen?
    private var alert: Alert?
    
    //MARK: - Init
    init(with pokemonDetail: Pokemon) {
        self.viewModel = DetailViewModel(pokemon: pokemonDetail)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        self.viewModel?.configurarDelegate(delegate: self)
        self.screen = DetailScreen()
        self.screen?.configDelegate(delegate: self)
        self.alert = Alert(controller: self)
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.getPokemonDetail()
    }

}

//MARK: - DetailViewModelProtocol
extension DetailViewController: DetailViewModelProtocol {
    func sucessRequest() {
        guard let viewModel = self.viewModel else {return}
        self.screen?.pokeName.text = viewModel.getPokemonName()
        self.view.setBackgroundColor(tipe:viewModel.getPokemonTipe())
        self.screen?.pokeId.text = viewModel.getPokemonId()
        self.screen?.tipeImage.image = UIImage(named: viewModel.getPokemonTipe())
        self.screen?.tipeLabel.text = viewModel.getPokemonTipe().capitalized
        self.screen?.tipe2Image.image = UIImage(named: viewModel.getPokemonTipe2())
        self.screen?.tipe2Label.text = viewModel.getPokemonTipe2().capitalized
        self.screen?.pokeImage.loadImage(urlString: viewModel.getPokemonImage())
        
        self.screen?.pokemonStatus.heightLabel.text = viewModel.getPokemonHeight()
        self.screen?.pokemonStatus.weightLabel.text = viewModel.getPokemonWeight()
        
        self.screen?.pokemonStatus.hpPokemon.text = String(viewModel.getPokemonHp())
        self.screen?.pokemonStatus.hpProgress.setProgress(Float(viewModel.getPokemonHp())/150, animated: true)
        self.screen?.pokemonStatus.atkPokemon.text = String(viewModel.getPokemonAtk())
        self.screen?.pokemonStatus.atkProgress.setProgress(Float(viewModel.getPokemonAtk())/150, animated: true)
        self.screen?.pokemonStatus.defPokemon.text = String(viewModel.getPokemonDef())
        self.screen?.pokemonStatus.defProgress.setProgress(Float(viewModel.getPokemonDef())/150, animated: true)
        self.screen?.pokemonStatus.spAPokemon.text = String(viewModel.getPokemonSpA())
        self.screen?.pokemonStatus.spAProgress.setProgress(Float(viewModel.getPokemonSpA())/150, animated: true)
        self.screen?.pokemonStatus.spDPokemon.text = String(viewModel.getPokemonSpD())
        self.screen?.pokemonStatus.spDProgress.setProgress(Float(viewModel.getPokemonSpD())/150, animated: true)
        self.screen?.pokemonStatus.speedPokemon.text = String(viewModel.getPokemonSpeed())
        self.screen?.pokemonStatus.speedProgress.setProgress(Float(viewModel.getPokemonSpeed())/150, animated: true)
    }
    
    func failureRequest(error: String) {
        self.alert?.getAlert(titulo: "Error", mensagem: error)
    }
    
}

//MARK: - DetailScreenProtocol
extension DetailViewController: DetailScreenProtocol {
    func tappedBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
