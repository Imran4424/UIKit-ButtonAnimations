//
//  AnimatedButton.swift
//  ButtonAnimations
//
//  Created by Shah Md Imran Hossain on 1/3/23.
//

import UIKit

class AnimatedButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 150).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        setup(title: title)
    }
    
    private func setup(title: String = "Button") {
        layer.cornerRadius = 12
        backgroundColor = .blue
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateButton)))
        addTarget(self, action: #selector(animateButtonDown), for: .touchDown)
        addTarget(self, action: #selector(animateButtonUp), for: .touchUpInside)
    }
    
    @objc private func animateButtonDown() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }

    }
    
    @objc private func animateButtonUp() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.transform = .identity
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
