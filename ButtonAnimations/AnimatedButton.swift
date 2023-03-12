//
//  AnimatedButton.swift
//  ButtonAnimations
//
//  Created by Shah Md Imran Hossain on 1/3/23.
//

import UIKit

class AnimatedButton: UIButton {
    private var wAnchor = NSLayoutConstraint()
    private var hAnchor = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        wAnchor = widthAnchor.constraint(equalToConstant: 150)
        wAnchor.isActive = true
        hAnchor = heightAnchor.constraint(equalToConstant: 60)
        hAnchor.isActive = true
        
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
        wAnchor.isActive = false
        hAnchor.isActive = false
        
        wAnchor.constant = 120
        hAnchor.constant = 120
        
        wAnchor.isActive = true
        hAnchor.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.superview?.layoutIfNeeded()
        }

    }
    
    @objc private func animateButtonUp() {
        wAnchor.isActive = false
        hAnchor.isActive = false
        
        wAnchor.constant = 150
        hAnchor.constant = 54
        
        wAnchor.isActive = true
        hAnchor.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.superview?.layoutIfNeeded()
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
