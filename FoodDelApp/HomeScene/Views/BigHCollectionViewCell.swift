//
//  BigHCollectionViewCell.swift
//  FoodDelApp
//
//  Created by user on 04.01.2025.
//

import UIKit

class BigHCollectionViewCell: UICollectionViewCell {
    //MARK: - Property
    let topView = UIView()
    let titleLabel = UILabel()
    

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
            topView.widthAnchor.constraint(equalToConstant: 130),
            topView.heightAnchor.constraint(equalToConstant: 130),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
        
    }
    
    func setupBottomLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .black
        titleLabel.text = "Title"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            //titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}

