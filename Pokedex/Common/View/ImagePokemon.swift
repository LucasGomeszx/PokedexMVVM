//
//  ImagePokemon.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 31/08/22.
//

import Foundation
import UIKit

var imageCache = [String:Data]()

class ImagePokemon: UIImageView {
    //MARK: - Pripriedades
    var task: URLSessionDataTask!
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFill
    }
    
    //MARK: - Metodos
    func loadImage(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        if let task = task {
            task.cancel()
        }
        
        if let cacheImage = imageCache[url.absoluteString] {
            self.image = UIImage(data: cacheImage)
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Couldn't download image: ", error)
                return
            }
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else {return}
            imageCache[url.absoluteString] = data
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
    
}
