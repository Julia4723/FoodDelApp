//
//  LoginViewController.swift
//  FoodDelApp
//
//  Created by user on 30.12.2024.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFaceBookTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {
    
    private var state: LoginViewState = .initial
    var viewOutput: LoginViewOutput!
    private var isKeyboardShow = false
    private var bottomCTValue = 0.0
    
    //MARK: - Property
    private lazy var bottomView = BottomView()
    private lazy var signInUserName = CustomTextField()
    private lazy var signUpUserName = CustomTextField()
    private lazy var signInPassword = CustomTextField()
    private lazy var signUpPassword = CustomTextField()
    private lazy var signUpReEnter = CustomTextField()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = AuthButton()
    private lazy var signUpButton = AuthButton()
    private lazy var titleLabel = UILabel()
    private lazy var forgotLabel = UILabel()
    
    private lazy var verticalStack = UIStackView()
    
    
    //MARK: - Constraints
    private var stackViewBottomCT = NSLayoutConstraint()
    
    
    //MARK: - Init
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        super.init(nibName: nil, bundle: nil)
        self.state = state
        self.viewOutput = viewOutput
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupObservers()
        
    }
    
    deinit {
        stopKeyBoardListener()
    }
    
    //MARK: - Methods
    func facebookPress() {
        print("facebook")
    }
    
    func googlePress() {
        print("google")
    }
}

//MARK: - Layout
private extension LoginViewController {
    
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signUp:
            setupBottomView()
            setupStack()
            setupSignUpUserName()
            setupSignUpPass()
            setupSignUpEnterPass()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupNavigationBar()
        case .signIn:
            setupBottomView()
            setupStack()
            setupSignInPassword()
            setupSignInUserName()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupNavigationBar()
        }
        
    }
    
    func setupNavigationBar() {
        let backImage = UIImage(resource: .back)
        let backButton = UIBarButtonItem(
            image: backImage,
            style: .plain,
            target: navigationController,
            action: #selector(navigationController?.popViewController(animated:))
        )
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    
    }
    
    func setupStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        switch state {
        case .initial:
            return
        case .signIn:
            verticalStack.addArrangedSubview(signInUserName)
            verticalStack.addArrangedSubview(signInPassword)
            bottomCTValue = -262
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCTValue)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
            ])
            
        case .signUp:
            verticalStack.addArrangedSubview(signUpUserName)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnter)
            bottomCTValue = -227
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCTValue)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
            ])
        }
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        switch state {
        case .signIn:
            titleLabel.text = "Sign In"
            
        case .signUp:
            titleLabel.text = "Sign Up"
            
        case .initial:
            return
        }
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    func setupSignInPassword() {
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        
        NSLayoutConstraint.activate([
            signInPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    func setupSignInUserName() {
        signInUserName.translatesAutoresizingMaskIntoConstraints = false
        signInUserName.placeholder = "Username"
        
        NSLayoutConstraint.activate([
            signInUserName.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInUserName.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInUserName.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button2Action = facebookPress
        bottomView.button1Action = googlePress
        
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(equalToConstant: 150),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        logoImage.image = UIImage(resource: .appstore)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 109),
            logoImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 57),
            logoImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.buttonAuth = .primary
        signInButton.action = onSignInTapped
        
        switch state {
        case .initial:
            signInButton.setTitle("Sign In")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 52)
            ])
            
        case .signIn:
            signInButton.setTitle("Sign In")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 60),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 52)
            ])
        case .signUp:
            signInButton.setTitle("Sign Up")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 52)
            ])
        }
    }
    
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.text = "Forgot Password?"
        forgotLabel.textColor = .systemGray2
        forgotLabel.font = .systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30)
        ])
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up")
        signUpButton.buttonAuth = .secondary
        signUpButton.action = onSignUpTapped
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 52)
            
        ])
        
    }
    
    func setupSignUpPass() {
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        
        NSLayoutConstraint.activate([
            signUpPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 52),
            
        ])
    }
    
    func setupSignUpUserName() {
        signUpUserName.translatesAutoresizingMaskIntoConstraints = false
        signUpUserName.placeholder = "Enter Username"
        
        NSLayoutConstraint.activate([
            signUpUserName.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpUserName.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpUserName.heightAnchor.constraint(equalToConstant: 52),
            
        ])
    }
    
    func setupSignUpEnterPass() {
        signUpReEnter.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnter.placeholder = "Re-enter password"
        
        NSLayoutConstraint.activate([
            signUpReEnter.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpReEnter.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpReEnter.heightAnchor.constraint(equalToConstant: 52),
            
        ])
    }
    
    
}

//MARK: - LoginViewInputDelegate
extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        //
    }
    
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignUp()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onFaceBookTapped() {
        //
    }
    
    func onForgotTapped() {
        //
    }
    
    
}


//MARK: - Keyboard Listener (Observers)
private extension LoginViewController {
    func setupObservers() {
        startKeyBoardListener()
    }
    
    func startKeyBoardListener() {
        NotificationCenter.default.addObserver(self, selector: #selector (keyBoardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:  #selector (keyBoardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func stopKeyBoardListener() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func keyBoardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardHeight = keyboardFrame.cgRectValue.height
        if !isKeyboardShow {
            UIView.animate(withDuration: 0.3) {
                self.stackViewBottomCT.constant -= keyboardHeight / 4
                self.view.layoutIfNeeded()
                self.isKeyboardShow = true
            }
        }
    }
    
    @objc func keyBoardWillHide(_ notification: Notification) {
        if isKeyboardShow {
            UIView.animate(withDuration: 0.3) {
                self.stackViewBottomCT.constant = self.bottomCTValue
                self.view.layoutIfNeeded()
                self.isKeyboardShow = false
            }
        }
    }
}
