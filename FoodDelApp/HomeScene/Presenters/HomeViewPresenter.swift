//
//  HomeViewPresenter.swift
//  FoodDelApp
//
//  Created by user on 06.01.2025.
//


import UIKit


protocol HomePresenterProtocol: AnyObject {
    func getSelectedCategory() -> FoodCategory
    var categoryData: [FoodCategory] {get}
    
   // var foodMenuData: [FoodMenuItem] {get}
   // var restaurantData: [Restaurant] {get}
}

class HomeViewPresenter: HomePresenterProtocol {
   
    //MARK: - Property
    let coordinator: HomeCoordinator
    var categoryData: [FoodCategory] = []
    
    
    //MARK: - Init
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        getCategoryData()
    }

    
    func getSelectedCategory() -> FoodCategory {
        return .none
    }
    
    private func getCategoryData() {
        categoryData = [.drink, .cake, .food, .salad, .snack]
    }
    
    
}
