//
//  LoginViewPresenter.swift
//  FoodDelApp
//
//  Created by user on 31.12.2024.
//

import UIKit

protocol LoginViewOutput: AnyObject {
    func loginStart(login: String, password: String)
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    private var coordinator: LoginCoordinator?
    weak var viewInput: LoginViewInput?
    
    init(coordinator: LoginCoordinator? = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

private extension LoginPresenter {
    func goToMainScreen() {
        coordinator?.finish()
    }
}


extension LoginPresenter: LoginViewOutput {
    func loginStart(login: String, password: String) {
        viewInput?.startLoader()
        if login == "test@mail.com" && password == "1234" {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
                DispatchQueue.main.async {
                    self.goToMainScreen()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                print("Wrong")
                self.viewInput?.stopLoader()
            }
        }
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
