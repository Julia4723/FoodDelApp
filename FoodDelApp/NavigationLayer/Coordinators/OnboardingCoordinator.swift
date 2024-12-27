//
//  OnboardingCoordinator.swift
//  FoodDelApp
//
//  Created by user on 26.12.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    }
    
    
    override func finish() {
       //
    }
}


private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [OnboardingScreen]()
        
        let firstVC = OnboardingScreen()
        firstVC.imageShow =  UIImage(resource: .chicken)
        firstVC.titleText =  "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingScreen()
        secondVC.imageShow =  UIImage(resource: .shipped)
        secondVC.titleText =  "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.buttonText = "Next"
       
        let thirdVC = OnboardingScreen()
        thirdVC.imageShow =  UIImage(resource: .medal)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.buttonText = "Next"
        
        let fourVC = OnboardingScreen()
        fourVC.imageShow =  UIImage(resource: .credit)
        fourVC.titleText = "Payment Online"
        fourVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        fourVC.buttonText = "Finish"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourVC)
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
