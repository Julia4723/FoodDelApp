//
//  OnboardingViewController.swift
//  FoodDelApp
//
//  Created by user on 26.12.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: - Property
    private var pages = [OnboardingScreen]()
    private var currentPageIndex = 0
    
    
    //MARK: - Vies
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    private let button = AuthButton()
    var viewOutput: OnboardingViewOutput!
    
    init(pages: [OnboardingScreen] = [OnboardingScreen](), viewOutput: OnboardingViewOutput!) {
        super.init(nibName: nil, bundle: nil)
        self.pages = pages
        self.viewOutput = viewOutput
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageViewController()
        setupPageControl()
        setupButton()
    }
}

private extension OnboardingViewController {
   @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true, completion: nil)
            button.setTitle(pages[1].buttonText)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true, completion: nil)
            button.setTitle(pages[2].buttonText)
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true, completion: nil)
            button.setTitle(pages[3].buttonText)
        case 3:
            print("Exit")
            viewOutput.onboardingFinish()
        default:
            break
        }
    }
}


//MARK: - Layout
private extension OnboardingViewController {
    func setupPageViewController() {
    
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        let page = pages[0]
        let title = page.buttonText
        button.setTitle(title)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    
    func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.action = buttonPressed
        button.buttonAuth = .third
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 52)
            
        ])
    }
}

//MARK: - Delegates
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingScreen), currentIndex > 0 else { return nil}
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingScreen), currentIndex < pages.count - 1 else { return nil}
        
        return pages[currentIndex + 1]
    }
}


extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingScreen) {
            if let index = pages.firstIndex(of: pendingViewControllers.first! as!
                                            OnboardingScreen) {
                currentPageIndex = index
            }
//            pageControl.currentPage = index
//            let page = pages[index]
//            let title = page.buttonText
//            button.setTitle(title, for: .normal)
            
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = currentPageIndex
            let page = pages[currentPageIndex]
            let title = page.buttonText
            button.setTitle(title)
        }
    }
}

