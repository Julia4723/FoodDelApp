//
//  OnboardingCoordinator.swift
//  FoodDelApp
//
//  Created by user on 26.12.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    //MARK: - Property
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

//MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
