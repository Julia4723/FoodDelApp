//
//  AuthButton.swift
//  FoodDelApp
//
//  Created by user on 30.12.2024.
//

import UIKit

enum ButtonState {
    case primary
    case secondary
    case third
}

class AuthButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    var buttonAuth: ButtonState = .third {
        didSet {
            setStateButton(state: buttonAuth)
        }
    }
    
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        setupButton()
    }
    
    private func setupButton() {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 24
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
            
        ])
    }
    
    @objc private func buttonPressed() {
        guard let action = self.action else {return}
        action()
    }
    
    private func setStateButton(state: ButtonState){
        switch state {
        case .primary:
            button.backgroundColor = AppColors.accentColor
            button.setTitleColor(.white, for: .normal)
        case .secondary:
            button.backgroundColor = .systemGray4
            button.setTitleColor(.black, for: .normal)
        case .third:
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
}


