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
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.backgroundColor = .blue
        setupTopView()
        setupBottomLabel()
    }
    
    func setupTopView() {
        contentView.addSubview(topView)
        topView.backgroundColor = .green
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.widthAnchor.constraint(equalToConstant: 70),
            topView.heightAnchor.constraint(equalToConstant: 70),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
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
