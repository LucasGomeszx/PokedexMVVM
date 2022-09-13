//
//  ViewController.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 25/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Propriedades
    private var screen: HomeScreen?
    private var viewModel: HomeViewModel!
    private var alert: Alert?
    
    //MARK: - LifeCycle
    override func loadView() {
        self.viewModel = HomeViewModel(delegate: self)
        self.screen = HomeScreen()
        self.view = self.screen
        self.alert = Alert(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        self.screen?.searchDelegate(delegate: self)
        self.viewModel?.getPokemons()
    }
    
    private func setupNavigation() {
        title = "Pokedex"
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationItem.searchController = self.screen?.searchController
    }

}

//MARK: - CollectionViewDelegate, DataSorce, FlowLayout
extension HomeViewController: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getPokeCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScreenCell.identifier, for: indexPath) as? HomeScreenCell
        cell?.configureCell(pokemon: self.viewModel.getPokemon(index: indexPath))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController(with: self.viewModel.getPokemon(index: indexPath))
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - 5, height: 200)
    }
    
}

extension HomeViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.filtrarPokemon(text: searchText)
        self.screen?.pokemonCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.cancellTapped()
        self.screen?.pokemonCollectionView.reloadData()
    }
    
}

//MARK: - HomeViewModelProtocol
extension HomeViewController: HomeViewModelProtocol {
    func successResult() {
        self.screen?.collectionViewDelegate(dataSource: self, delegate: self)
    }
    
    func failureResult(error: String) {
        self.alert?.getAlert(titulo: "Erro", mensagem: error, compleion: nil)
    }
    
}
