//
//  LoginCoordinator.swift
//  FoodDelApp
//
//  Created by user on 02.01.2025.
//
import UIKit

class LoginCoordinator: Coordinator {
    
        //MARK: - Property
        private let factory = SceneFactory.self
        
        //MARK: - Methods
        override func start() {
            showAuthScene()
        }
        
        
        override func finish() {
            print("LoginCoordinator finish")
            finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        }
    }

    //MARK: - Navigation
extension LoginCoordinator {
    
    func showAuthScene() {
        guard let navigationController = navigationController else { return}
        let viewController = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    func showSignInScene() {
        guard let navigationController = navigationController else { return}
        let viewController = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showSignUpScene() {
        guard let navigationController = navigationController else { return}
        let viewController = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}
