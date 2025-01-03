//
//  OnboardingViewPresenter.swift
//  FoodDelApp
//
//  Created by user on 26.12.2024.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    private let userStorage = UserStorage.shared
    
    
    //MARK: - Property
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    
    func onboardingFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
    
}
