//
//  FoodRecipeModel.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//


import Foundation
import Combine

class FoodDetailsViewModel: ObservableObject {
    @Published var meal: DetailedMeal?
    @Published var mealName: String?

    func fetchMeal(with id: String) {
        NetworkManager.shared.fetchMeal(with: id) { result in
            switch result {
            case .failure(let error):
                print("Failed to fetch meal \(error)")
            case .success(let response):
                DispatchQueue.main.async {
                    self.meal = response.meals[0]
                }
            }
        }
    }
}




