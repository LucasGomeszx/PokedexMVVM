//
//  LabelDefault.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 01/09/22.
//

import Foundation
import UIKit

class LabelDefault: UILabel {
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initDefault(text: "" ,font : UIFont.systemFont(ofSize: 16,weight: .regular))
    }
    
    init(font: UIFont) {
        super.init(frame: .zero)
        initDefault(text: "" ,font : font)
    }
    
    init(text: String ,font: UIFont) {
        super.init(frame: .zero)
        initDefault(text: text ,font: font)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Metodos
    private func initDefault(text: String ,font: UIFont){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.font = font
        self.text = text
    }
    
}
