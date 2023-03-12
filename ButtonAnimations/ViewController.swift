//
//  ViewController.swift
//  ButtonAnimations
//
//  Created by Shah Md Imran Hossain on 1/3/23.
//

import UIKit

class ViewController: UIViewController {
    var wolverineButton = AnimatedButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
    }

    private func setupViews() {
        wolverineButton = AnimatedButton(title: "Wolverine")
        view.addSubview(wolverineButton)
    }
    
    private func layoutViews() {
        wolverineButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        wolverineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

