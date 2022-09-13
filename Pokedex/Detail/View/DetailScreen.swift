//
//  DetailScreen.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 30/08/22.
//

import Foundation
import UIKit
protocol DetailScreenProtocol: AnyObject {
    func tappedBackButton()
}

class DetailScreen: UIView {
    //MARK: - Propriedades
    
    weak var delegate: DetailScreenProtocol?
    
    //MARK: - Elementos
    lazy var detailContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.layer.cornerRadius = 20
        v.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        v.backgroundColor = .white
        return v
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    lazy var blurDetailView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 20
        return blurView
    }()
    
    lazy var backButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setBackgroundImage(UIImage(systemName: "arrow.backward"), for: .normal)
        b.tintColor = .black
        b.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return b
    }()
    
    lazy var pokeName = LabelDefault(font: UIFont.systemFont(ofSize: 30, weight: .bold))
    
    lazy var pokeId = LabelDefault(font: UIFont.systemFont(ofSize: 20, weight: .bold))
    
    lazy var tipeImage = ImagePokemon()
    lazy var tipeLabel = LabelDefault(font: UIFont.systemFont(ofSize: 16))
    
    lazy var tipe2Image = ImagePokemon()
    lazy var tipe2Label = LabelDefault(font: UIFont.systemFont(ofSize: 16))
    
    lazy var pokeImage = ImagePokemon()
    
    lazy var pokemonStatus: StatusContainer = {
        let l = StatusContainer()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    //MARK: - Metodos
    public func configDelegate(delegate: DetailScreenProtocol) {
        self.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.tappedBackButton()
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

//MARK: - Configurando ViewCode
extension DetailScreen: ViewCode {
    func addViewCode() {
        self.addSubview(blurView)
        self.addSubview(backButton)
        self.addSubview(pokeId)
        self.addSubview(pokeName)
        self.addSubview(tipeImage)
        self.addSubview(tipeLabel)
        self.addSubview(tipe2Image)
        self.addSubview(tipe2Label)
        self.addSubview(detailContainer)
        self.detailContainer.addSubview(blurDetailView)
        self.addSubview(pokemonStatus)
        self.addSubview(pokeImage)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.blurView.topAnchor.constraint(equalTo: self.topAnchor),
            self.blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.backButton.heightAnchor.constraint(equalToConstant: 40),
            self.backButton.widthAnchor.constraint(equalToConstant: 40),
            
            self.pokeName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25),
            self.pokeName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.pokeImage.bottomAnchor.constraint(equalTo: self.detailContainer.topAnchor, constant: 40),
            self.pokeImage.centerXAnchor.constraint(equalTo: self.detailContainer.centerXAnchor),
            self.pokeImage.heightAnchor.constraint(equalToConstant: 200),
            self.pokeImage.widthAnchor.constraint(equalToConstant: 200),
            
            self.tipeImage.topAnchor.constraint(equalTo: self.pokeImage.topAnchor, constant: 10),
            self.tipeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.tipeImage.heightAnchor.constraint(equalToConstant: 25),
            self.tipeImage.widthAnchor.constraint(equalToConstant: 25),
            
            self.tipeLabel.centerYAnchor.constraint(equalTo: self.tipeImage.centerYAnchor),
            self.tipeLabel.leadingAnchor.constraint(equalTo: self.tipeImage.trailingAnchor, constant: 5),
            
            self.tipe2Image.topAnchor.constraint(equalTo: self.tipeImage.bottomAnchor,constant: 5),
            self.tipe2Image.leadingAnchor.constraint(equalTo: self.tipeImage.leadingAnchor),
            self.tipe2Image.heightAnchor.constraint(equalToConstant: 25),
            self.tipe2Image.widthAnchor.constraint(equalToConstant: 25),
            
            self.tipe2Label.centerYAnchor.constraint(equalTo: self.tipe2Image.centerYAnchor),
            self.tipe2Label.leadingAnchor.constraint(equalTo: self.tipe2Image.trailingAnchor, constant: 5),
            
            self.pokeId.bottomAnchor.constraint(equalTo: self.detailContainer.topAnchor,constant: -10),
            self.pokeId.leadingAnchor.constraint(equalTo: self.pokeImage.trailingAnchor),
            self.pokeId.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.detailContainer.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            self.detailContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.detailContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.detailContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.blurDetailView.topAnchor.constraint(equalTo: self.detailContainer.topAnchor,constant: 20),
            self.blurDetailView.leadingAnchor.constraint(equalTo: self.detailContainer.leadingAnchor, constant: 20),
            self.blurDetailView.trailingAnchor.constraint(equalTo: self.detailContainer.trailingAnchor,constant: -20),
            self.blurDetailView.bottomAnchor.constraint(equalTo: self.detailContainer.bottomAnchor, constant: -20),
            
            self.pokemonStatus.topAnchor.constraint(equalTo: self.blurDetailView.topAnchor),
            self.pokemonStatus.leadingAnchor.constraint(equalTo: self.blurDetailView.leadingAnchor),
            self.pokemonStatus.trailingAnchor.constraint(equalTo: self.blurDetailView.trailingAnchor),
            self.pokemonStatus.bottomAnchor.constraint(equalTo: self.blurDetailView.bottomAnchor),
        ])
    }
    
    func additionalConfig() {
        self.backgroundColor = .white
        self.pokeId.textColor = .white
        self.pokeId.textAlignment = .center
    }
    
}
