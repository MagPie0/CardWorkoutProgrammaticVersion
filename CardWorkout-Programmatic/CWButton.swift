//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Maggie Hillebrecht on 8/4/24.
//

import UIKit

class CWButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame) //super gives us everything apple gives us
        configure() //sets the buttons with the style we put
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero) //frame is like constraint
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false //tamic for short, basically "use autolayout"
        
    }

}
