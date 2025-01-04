//
//  HomeCoordinator.swift
//  FoodDelApp
//
//  Created by user on 26.12.2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    //MARK: - Property
    private let factory = SceneFactory.self
    
    override func start() {
        showHomeScene()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation
extension HomeCoordinator {
    
    func showHomeScene() {
        guard let navigationController = navigationController else { return}
        let viewController = factory.makeHomeScene(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
