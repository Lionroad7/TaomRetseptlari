//
//  FoodCaetegoryView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

struct FoodCategoryView: View {
    let category: Category
    
    @StateObject private var viewModel = FoodCategoryViewModel()
    @State private var searchText = ""

    var filteredMeals: [Meal] {
        if searchText.isEmpty {
            return viewModel.meals
        } else {
            return viewModel.meals.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        VStack {
            SearchBar(text: $searchText, placeholder: "Search Meals")
            
            List(filteredMeals) { meal in
                NavigationLink(destination: FoodDetailsView(mealId: meal.id, mealName: meal.name)) {
                    FoodCategoryMealCell(meal: meal)
                }
            }
            .onAppear {
                viewModel.fetchMeals(for: category.name)
            }
        }
        .navigationBarHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
        }
    }
}



