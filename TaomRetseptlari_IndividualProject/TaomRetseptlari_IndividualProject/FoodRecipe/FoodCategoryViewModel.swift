//
//  FoodCategoryViewModel.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import Foundation
import Combine

class FoodCategoryViewModel: ObservableObject {
    @Published var meals: [Meal] = []

    func fetchMeals(for category: String) {
        NetworkManager.shared.fetchCategoryMeals(for: category) { result in
            switch result {
            case .failure(let error):
                print("Failed to fetch meals: \(error)")
            case .success(let response):
                DispatchQueue.main.async {
                    self.meals = response.meals
                }
            }
        }
    }
}



