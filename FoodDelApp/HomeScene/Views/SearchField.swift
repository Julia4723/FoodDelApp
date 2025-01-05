//
//  SearchField.swift
//  FoodDelApp
//
//  Created by user on 05.01.2025.
//

import UIKit

class SearchField: UITextField {
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.layer.cornerRadius = 24
        self.backgroundColor = AppColors.grayBackground
        self.placeholder = "Search"
        self.font = UIFont.systemFont(ofSize: 14)
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 4, width: 20, height: 20))
        imageView.image = UIImage(resource: .loupe)
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 24))
        leftPaddingView.addSubview(imageView)
        
        //Отступ для текста внутри инпута
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = leftPaddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        
    }
}
