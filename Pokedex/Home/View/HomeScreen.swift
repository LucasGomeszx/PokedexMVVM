//
//  HomeScreen.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 25/08/22.
//

import Foundation
import UIKit

class HomeScreen: UIView {
    //MARK: - Elementos
    lazy var pokemonCollectionView: UICollectionView = {
        let c = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        c.translatesAutoresizingMaskIntoConstraints = false
        c.register(HomeScreenCell.self, forCellWithReuseIdentifier: HomeScreenCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        c.setCollectionViewLayout(layout, animated: false)
        c.backgroundColor = .clear
        return c
    }()
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        return searchController
    }()
    
    //MARK: - Metodos
    public func collectionViewDelegate(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate){
        self.pokemonCollectionView.delegate = delegate
        self.pokemonCollectionView.dataSource = dataSource
    }
    
    public func searchDelegate(delegate: UISearchBarDelegate) {
        self.searchController.searchBar.delegate = delegate
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
extension HomeScreen: ViewCode {
    func addViewCode() {
        self.addSubview(pokemonCollectionView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.pokemonCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.pokemonCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.pokemonCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.pokemonCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func additionalConfig() {
        self.backgroundColor = .white
    }

}
