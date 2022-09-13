//
//  StatusContainer.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 31/08/22.
//

import Foundation
import UIKit

class StatusContainer: UIView {
    //MARK: - Elementos
    lazy var pokemonStatus = LabelDefault(text: "Status", font: UIFont.systemFont(ofSize: 26, weight: .bold))
    
    lazy var heightLabel = LabelDefault(font: UIFont.systemFont(ofSize: 16, weight: .bold))
    lazy var weightLabel = LabelDefault(font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    lazy var hpLabel = LabelDefault(text: "HP:", font: UIFont.systemFont(ofSize: 16, weight: .bold))
    lazy var hpPokemon = LabelDefault()
    lazy var hpProgress = ProgressDefault()
    
    lazy var atkLabel = LabelDefault(text: "Attack:", font: UIFont.systemFont(ofSize: 16, weight: .bold))
    lazy var atkPokemon = LabelDefault()
    lazy var atkProgress = ProgressDefault()
    
    lazy var defLabel = LabelDefault(text: "Defense:", font: UIFont.systemFont(ofSize: 16, weight: .bold))
    lazy var defPokemon = LabelDefault()
    lazy var defProgress = ProgressDefault()
    
    lazy var spALabel = LabelDefault(text: "Sp.Atk:", font: UIFont.systemFont(ofSize: 16, weight: .bold))
    lazy var spAPokemon = LabelDefault()
    lazy var spAProgress = ProgressDefault()
    
    lazy var spDLabel = LabelDefault(text: "Sp.Def:", font: UIFont.systemFont(ofSize: 16, weight: .bold))
    lazy var spDPokemon = LabelDefault()
    lazy var spDProgress = ProgressDefault()
    
    lazy var speedLabel = LabelDefault(text: "Speed:", font: UIFont.systemFont(ofSize: 16, weight: .bold))
    lazy var speedPokemon = LabelDefault()
    lazy var speedProgress = ProgressDefault()
    
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
extension StatusContainer: ViewCode {
    func addViewCode() {
        self.addSubview(pokemonStatus)
        self.addSubview(heightLabel)
        self.addSubview(weightLabel)
        self.addSubview(hpLabel)
        self.addSubview(hpPokemon)
        self.addSubview(hpProgress)
        self.addSubview(atkLabel)
        self.addSubview(atkPokemon)
        self.addSubview(atkProgress)
        self.addSubview(defLabel)
        self.addSubview(defPokemon)
        self.addSubview(defProgress)
        self.addSubview(spALabel)
        self.addSubview(spAPokemon)
        self.addSubview(spAProgress)
        self.addSubview(spDLabel)
        self.addSubview(spDPokemon)
        self.addSubview(spDProgress)
        self.addSubview(speedLabel)
        self.addSubview(speedPokemon)
        self.addSubview(speedProgress)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.pokemonStatus.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            self.pokemonStatus.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.heightLabel.topAnchor.constraint(equalTo: self.pokemonStatus.bottomAnchor, constant: 20),
            self.heightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            
            self.weightLabel.topAnchor.constraint(equalTo: self.pokemonStatus.bottomAnchor, constant: 20),
            self.weightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            
            self.hpLabel.topAnchor.constraint(equalTo: self.heightLabel.bottomAnchor, constant: 25),
            self.hpLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.hpLabel.widthAnchor.constraint(equalToConstant: 80),
            
            self.hpPokemon.leadingAnchor.constraint(equalTo: self.hpLabel.trailingAnchor, constant: 10),
            self.hpPokemon.centerYAnchor.constraint(equalTo: self.hpLabel.centerYAnchor),
            self.hpPokemon.widthAnchor.constraint(equalToConstant: 40),
            
            self.hpProgress.leadingAnchor.constraint(equalTo: self.hpPokemon.trailingAnchor, constant: 10),
            self.hpProgress.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            self.hpProgress.centerYAnchor.constraint(equalTo: self.hpPokemon.centerYAnchor),
            self.hpProgress.heightAnchor.constraint(equalToConstant: 5),
            
            self.atkLabel.topAnchor.constraint(equalTo: self.hpLabel.bottomAnchor, constant: 20),
            self.atkLabel.leadingAnchor.constraint(equalTo: self.hpLabel.leadingAnchor),
            self.atkLabel.widthAnchor.constraint(equalTo: self.hpLabel.widthAnchor),
            
            self.atkPokemon.leadingAnchor.constraint(equalTo: self.atkLabel.trailingAnchor, constant: 10),
            self.atkPokemon.centerYAnchor.constraint(equalTo: self.atkLabel.centerYAnchor),
            self.atkPokemon.widthAnchor.constraint(equalTo: self.hpPokemon.widthAnchor),
            
            self.atkProgress.leadingAnchor.constraint(equalTo: self.atkPokemon.trailingAnchor, constant: 10),
            self.atkProgress.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25),
            self.atkProgress.centerYAnchor.constraint(equalTo: self.atkPokemon.centerYAnchor),
            self.atkProgress.heightAnchor.constraint(equalToConstant: 5),
            
            self.defLabel.topAnchor.constraint(equalTo: self.atkLabel.bottomAnchor, constant: 20),
            self.defLabel.leadingAnchor.constraint(equalTo: self.atkLabel.leadingAnchor),
            self.defLabel.widthAnchor.constraint(equalTo: self.hpLabel.widthAnchor),
            
            self.defPokemon.leadingAnchor.constraint(equalTo: self.defLabel.trailingAnchor,constant: 10),
            self.defPokemon.centerYAnchor.constraint(equalTo: self.defLabel.centerYAnchor),
            self.defPokemon.widthAnchor.constraint(equalTo: self.hpPokemon.widthAnchor),
            
            self.defProgress.leadingAnchor.constraint(equalTo: self.defPokemon.trailingAnchor, constant: 10),
            self.defProgress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.defProgress.centerYAnchor.constraint(equalTo: self.defPokemon.centerYAnchor),
            self.defProgress.heightAnchor.constraint(equalToConstant: 5),
            
            self.spALabel.topAnchor.constraint(equalTo: self.defLabel.bottomAnchor, constant: 20),
            self.spALabel.leadingAnchor.constraint(equalTo: self.atkLabel.leadingAnchor),
            self.spALabel.widthAnchor.constraint(equalTo: self.hpLabel.widthAnchor),
            
            self.spAPokemon.leadingAnchor.constraint(equalTo: self.spALabel.trailingAnchor,constant: 10),
            self.spAPokemon.centerYAnchor.constraint(equalTo: self.spALabel.centerYAnchor),
            self.spAPokemon.widthAnchor.constraint(equalTo: self.hpPokemon.widthAnchor),
            
            self.spAProgress.leadingAnchor.constraint(equalTo: self.spAPokemon.trailingAnchor, constant: 10),
            self.spAProgress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.spAProgress.centerYAnchor.constraint(equalTo: self.spAPokemon.centerYAnchor),
            self.spAProgress.heightAnchor.constraint(equalToConstant: 5),
            
            self.spDLabel.topAnchor.constraint(equalTo: self.spALabel.bottomAnchor, constant: 20),
            self.spDLabel.leadingAnchor.constraint(equalTo: self.atkLabel.leadingAnchor),
            self.spDLabel.widthAnchor.constraint(equalTo: self.hpLabel.widthAnchor),
            
            self.spDPokemon.leadingAnchor.constraint(equalTo: self.spDLabel.trailingAnchor,constant: 10),
            self.spDPokemon.centerYAnchor.constraint(equalTo: self.spDLabel.centerYAnchor),
            self.spDPokemon.widthAnchor.constraint(equalTo: self.hpPokemon.widthAnchor),
            
            self.spDProgress.leadingAnchor.constraint(equalTo: self.spDPokemon.trailingAnchor, constant: 10),
            self.spDProgress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.spDProgress.centerYAnchor.constraint(equalTo: self.spDPokemon.centerYAnchor),
            self.spDProgress.heightAnchor.constraint(equalToConstant: 5),
            
            self.speedLabel.topAnchor.constraint(equalTo: self.spDLabel.bottomAnchor, constant: 20),
            self.speedLabel.leadingAnchor.constraint(equalTo: self.atkLabel.leadingAnchor),
            self.speedLabel.widthAnchor.constraint(equalTo: self.hpLabel.widthAnchor),
            
            self.speedPokemon.leadingAnchor.constraint(equalTo: self.speedLabel.trailingAnchor,constant: 10),
            self.speedPokemon.centerYAnchor.constraint(equalTo: self.speedLabel.centerYAnchor),
            self.speedPokemon.widthAnchor.constraint(equalTo: self.hpPokemon.widthAnchor),
            
            self.speedProgress.leadingAnchor.constraint(equalTo: self.speedPokemon.trailingAnchor, constant: 10),
            self.speedProgress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.speedProgress.centerYAnchor.constraint(equalTo: self.speedPokemon.centerYAnchor),
            self.speedProgress.heightAnchor.constraint(equalToConstant: 5),
        ])
    }
    
    func additionalConfig() {
        
    }
    
}
