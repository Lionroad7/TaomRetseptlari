//
//  FoodFeedViewModel.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

class FoodFeedViewModel: ObservableObject {
    @Published var categories: [Category]?
    @Published var featuredMeals = [Meal]()

    func fetchFoodData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        fetchCategories {
            dispatchGroup.leave()
        }
        
        for _ in 1...4 {
            dispatchGroup.enter()
            fetchFeaturedMeals {
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
        }
    }
    
    private func fetchCategories(completion: @escaping () -> ()) {
        NetworkManager.shared.fetchCategories { result in
            switch result {
            case .failure(let error):
                print("Error fetching categories \(error)")
            case .success(let response):
                DispatchQueue.main.async {
                    self.categories = response.categories
                    completion()
                }
            }
        }
    }
    
    private func fetchFeaturedMeals(completion: @escaping () -> ()) {
        NetworkManager.shared.fetchRandomMeal { result in
            switch result {
            case .failure(let error):
                print("Error fetching random meal: \(error)")
            case .success(let response):
                DispatchQueue.main.async {
                    self.featuredMeals.append(response.meals[0])
                    completion()
                }
            }
        }
    }
}


