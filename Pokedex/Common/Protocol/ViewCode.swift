//
//  ViewCode.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 25/08/22.
//

import Foundation

protocol ViewCode {
    func addViewCode()
    func addConstraints()
    func additionalConfig()
}

extension ViewCode {
    func configurandoViewCode() {
        addViewCode()
        addConstraints()
        additionalConfig()
    }
}
