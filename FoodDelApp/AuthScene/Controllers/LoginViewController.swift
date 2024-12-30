//
//  LoginViewController.swift
//  FoodDelApp
//
//  Created by user on 30.12.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
    func facebookPress() {
        print("facebook")
    }
    
    func googlePress() {
        print("google")
    }
}


private extension LoginViewController {
    
    func setupLayout() {
        setupBottomView()
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button2Action = facebookPress
        bottomView.button1Action = googlePress
        
        
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(equalToConstant: 150),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
    }
}
