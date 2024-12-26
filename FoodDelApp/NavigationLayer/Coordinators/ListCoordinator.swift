//
//  ListCoordinator.swift
//  FoodDelApp
//
//  Created by user on 26.12.2024.
//

import UIKit

class ListCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .cyan
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
