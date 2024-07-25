//
//  RandomFoodViewModel.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import Foundation
import Combine

class RandomFoodViewModel: ObservableObject {
    @Published var meal: Meal?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchRandomMeal()
    }
    
    func fetchRandomMeal() {
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.fetchRandomMeal { [weak self] (result: Result<MealResponse, Error>) in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let response):
                self.meal = response.meals.first
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

