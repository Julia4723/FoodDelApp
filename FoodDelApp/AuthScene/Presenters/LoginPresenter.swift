//
//  LoginViewPresenter.swift
//  FoodDelApp
//
//  Created by user on 31.12.2024.
//

import UIKit

protocol LoginViewOutput: AnyObject {
    func loginStart()
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    private var coordinator: AppCoordinator?
    weak var viewInput: LoginViewInput?
    
    init(coordinator: AppCoordinator? = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}


extension LoginPresenter: LoginViewOutput {
    func loginStart() {
        //
    }
    
    func registrationStart() {
        //
    }
    
    func goToFacebookLogin() {
        //
    }
    
    func goToGoogleLogin() {
        //
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotPass() {
        //
    }
    
    func back() {
        //
    }
    
    
}
