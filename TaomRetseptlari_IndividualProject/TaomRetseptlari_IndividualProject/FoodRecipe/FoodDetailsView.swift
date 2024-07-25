//
//  FoodDetailsView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

struct FoodDetailsView: View {
    @ObservedObject var viewModel: FoodDetailsViewModel
    let mealId: String
    let mealName: String
    @State private var isFavorite: Bool = false

    init(mealId: String, mealName: String) {
        self.mealId = mealId
        self.mealName = mealName
        self.viewModel = FoodDetailsViewModel()
    }

    var body: some View {
        ScrollView {
            VStack {
                if let meal = viewModel.meal {
                    FoodDetailsHeaderView(meal: meal)
                        .padding(.bottom)
                    
                    FoodDetailsMealInfoView(meal: meal)
                        .padding(.bottom)

                    Button(action: {
                        withAnimation {
                            isFavorite.toggle()
                            saveFavoriteStatus()
                        }
                    }) {
                        HStack {
                            Image(systemName: isFavorite ? "star.fill" : "star")
                                .font(.title2)
                                .foregroundColor(isFavorite ? .yellow : .gray)
                            Text(isFavorite ? "Unfavorite" : "Favorite")
                                .fontWeight(.medium)
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding(.top)

                    Text("Ingredients")
                        .font(.headline)
                        .padding(.top)

                    ForEach(meal.getIngredients(), id: \.self) { ingredient in
                        FoodDetailsIngredientView(ingredient: ingredient)
                            .padding(.vertical, 4)
                    }
                }
            }
            .padding()
        }
        .background(Color.white.ignoresSafeArea())
        .navigationBarHidden(true)
        .navigationTitle(mealName)
        .onAppear {
            viewModel.fetchMeal(with: mealId)
            loadFavoriteStatus()
        }
    }

    private func saveFavoriteStatus() {
        UserDefaults.standard.set(isFavorite, forKey: "favorite_\(mealId)")
        updateFavorites()
    }

    private func loadFavoriteStatus() {
        isFavorite = UserDefaults.standard.bool(forKey: "favorite_\(mealId)")
    }

    private func updateFavorites() {
        var likedMeals = UserDefaults.standard.stringArray(forKey: "likedMeals") ?? []
        if isFavorite {
            if !likedMeals.contains(mealName) {
                likedMeals.append(mealName)
            }
        } else {
            likedMeals.removeAll { $0 == mealName }
        }
        UserDefaults.standard.set(likedMeals, forKey: "likedMeals")
    }
}
