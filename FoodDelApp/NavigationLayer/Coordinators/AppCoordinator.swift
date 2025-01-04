//
//  AppCoordinator.swift
//  FoodDelApp
//
//  Created by user on 26.12.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    var tabBarController: UITabBarController?
    
    override func start() {
        showMainFlow()
        
//        if userStorage.passedOnboarding {
//            showAuthFlow()
//        } else {
//            showOnboardingFlow()
//        }
        
//        let loginPresenter = LoginPresenter(coordinator: self)
//        let loginVC = LoginViewController(viewOutput: loginPresenter, state: .signIn)
//        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
    
}

//MARK: - Methods for navigation
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return}
       let onboardingCoordinator = factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return}
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        self.tabBarController = tabBarController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        self.window?.layer.add(transition, forKey: kCATransition)
        //navigationController.pushViewController(tabBarController, animated: true)
        self.window?.rootViewController = self.tabBarController
    }
    
    func showAuthFlow() {
        guard let navigationController = navigationController else { return}
        let loginCoordinator = factory.makeLoginFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        loginCoordinator.start()
    }
}

//MARK: - Finish Delegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: any CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            showAuthFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .login:
            showMainFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
