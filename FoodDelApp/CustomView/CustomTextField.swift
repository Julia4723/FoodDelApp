//
//  CustomTextField.swift
//  FoodDelApp
//
//  Created by user on 31.12.2024.
//

import UIKit

class CustomTextField: UITextField {
    
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.layer.cornerRadius = 20
        self.backgroundColor = AppColors.grayBackground
        self.placeholder = "Text input"
        self.font = UIFont.systemFont(ofSize: 14)
        
        
        //Отступ для текста внутри инпута
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        
    }
}
