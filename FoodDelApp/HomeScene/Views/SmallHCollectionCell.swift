//
//  SmallHCollectionCell.swift
//  FoodDelApp
//
//  Created by user on 03.01.2025.
//

import UIKit

class SmallHCollectionCell: UICollectionViewCell {
    
    let topView = UIView()
    let label = UILabel()
    let imageView = UIImageView()
    var isCategorySelected = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: FoodCategory) {
        label.text = category.rawValue
        switch category {
        case .drink:
            imageView.image = UIImage(resource: .coffee).withTintColor(isCategorySelected ? .white : .black)
        case .snack:
            imageView.image = UIImage(resource: .potato).withTintColor(isCategorySelected ? .white : .black)
        case .food:
            imageView.image = UIImage(resource: .burger).withTintColor(isCategorySelected ? .white : .black)
        case .cake:
            imageView.image = UIImage(resource: .cake).withTintColor(isCategorySelected ? .white : .black)
        case .salad:
            imageView.image = UIImage(resource: .potato).withTintColor(isCategorySelected ? .white : .black)
        case .none:
            print(#function)
        }
    }
    
    func toggleSelected() {
        if isCategorySelected {
            imageView.image = imageView.image?.withTintColor(.black)
            topView.backgroundColor = AppColors.grayBackground
        } else {
            imageView.image = imageView.image?.withTintColor(.white)
            topView.backgroundColor = AppColors.accentColor
        }
        isCategorySelected.toggle()
    }
    
    func setupCell() {
        contentView.backgroundColor = .clear
        setupTopView()
        setupBottomLabel()
    }
    
    func setupTopView() {
        contentView.addSubview(topView)
        topView.backgroundColor = AppColors.grayBackground
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.widthAnchor.constraint(equalToConstant: 70),
            topView.heightAnchor.constraint(equalToConstant: 70),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
        
        topView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
        ])
        
    }
    
    func setupBottomLabel() {
        contentView.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
