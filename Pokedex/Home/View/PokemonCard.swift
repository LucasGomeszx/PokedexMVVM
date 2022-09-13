//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 25/08/22.
//

import Foundation
import UIKit

class PokemonCard: UIView {
    //MARK: - Elementos
    
    lazy var containerPokemon:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
        
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    lazy var tipeImage = ImagePokemon()
    lazy var tipeLabel = LabelDefault(font: UIFont.systemFont(ofSize: 16))
    
    lazy var tipe2Image = ImagePokemon()
    lazy var tipe2Label = LabelDefault(font: UIFont.systemFont(ofSize: 16))
    
    lazy var pokeImage = ImagePokemon()
    
    lazy var pokeName = LabelDefault(font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    lazy var pokeId = LabelDefault(font: UIFont.systemFont(ofSize: 18, weight: .bold))
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configurandoViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Configurando ViewCode
extension PokemonCard: ViewCode {
    func addViewCode() {
        self.containerPokemon.addSubview(blurView)
        self.containerPokemon.addSubview(pokeName)
        self.containerPokemon.addSubview(tipeImage)
        self.containerPokemon.addSubview(tipeLabel)
        self.containerPokemon.addSubview(tipe2Image)
        self.containerPokemon.addSubview(tipe2Label)
        self.containerPokemon.addSubview(pokeImage)
        self.containerPokemon.addSubview(pokeId)
        self.addSubview(containerPokemon)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.blurView.topAnchor.constraint(equalTo: self.containerPokemon.topAnchor),
            self.blurView.leadingAnchor.constraint(equalTo: self.containerPokemon.leadingAnchor),
            self.blurView.trailingAnchor.constraint(equalTo: self.containerPokemon.trailingAnchor),
            self.blurView.bottomAnchor.constraint(equalTo: self.containerPokemon.bottomAnchor),
            
            self.pokeName.topAnchor.constraint(equalTo: self.containerPokemon.topAnchor,constant: 15),
            self.pokeName.centerXAnchor.constraint(equalTo: self.containerPokemon.centerXAnchor),
            
            self.pokeImage.bottomAnchor.constraint(equalTo: self.containerPokemon.bottomAnchor),
            self.pokeImage.trailingAnchor.constraint(equalTo: self.containerPokemon.trailingAnchor),
            self.pokeImage.heightAnchor.constraint(equalToConstant: 100),
            self.pokeImage.widthAnchor.constraint(equalToConstant: 100),
            
            self.tipeImage.leadingAnchor.constraint(equalTo: self.containerPokemon.leadingAnchor, constant: 10),
            self.tipeImage.topAnchor.constraint(equalTo: self.pokeName.bottomAnchor, constant: 20),
            self.tipeImage.heightAnchor.constraint(equalToConstant: 25),
            self.tipeImage.widthAnchor.constraint(equalToConstant: 25),
            
            self.tipeLabel.leadingAnchor.constraint(equalTo: self.tipeImage.trailingAnchor, constant: 5),
            self.tipeLabel.centerYAnchor.constraint(equalTo: self.tipeImage.centerYAnchor),
            
            self.tipe2Image.leadingAnchor.constraint(equalTo: self.tipeImage.leadingAnchor),
            self.tipe2Image.topAnchor.constraint(equalTo: self.tipeImage.topAnchor, constant: 28),
            self.tipe2Image.heightAnchor.constraint(equalToConstant: 25),
            self.tipe2Image.widthAnchor.constraint(equalToConstant: 25),
            
            self.tipe2Label.leadingAnchor.constraint(equalTo: self.tipe2Image.trailingAnchor, constant: 5),
            self.tipe2Label.centerYAnchor.constraint(equalTo: self.tipe2Image.centerYAnchor),
            
            self.pokeId.bottomAnchor.constraint(equalTo: self.containerPokemon.bottomAnchor,constant: -10),
            self.pokeId.leadingAnchor.constraint(equalTo: self.containerPokemon.leadingAnchor,constant: 10),
            
            self.containerPokemon.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerPokemon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerPokemon.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.containerPokemon.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func additionalConfig() {
        self.backgroundColor = .lightGray
        self.pokeId.textColor = .white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
