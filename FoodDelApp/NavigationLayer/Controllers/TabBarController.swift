//
//  TabBarController.swift
//  FoodDelApp
//
//  Created by user on 26.12.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tabItem in tabBarControllers {
            self.addChild(tabItem)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = AppColors.accentColor
        
    }
}
