//
//  ProgressDefault.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 01/09/22.
//

import Foundation
import UIKit

class ProgressDefault: UIProgressView {
    
    init() {
        super.init(frame: .zero)
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
