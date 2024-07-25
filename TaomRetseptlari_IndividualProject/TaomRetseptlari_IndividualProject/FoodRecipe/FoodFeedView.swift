//
//  FoodRecipeView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI

struct FoodFeedView: View {
    @StateObject private var viewModel = FoodFeedViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    categoriesSection
                }
                .padding()
            }
            .background(Color.black) 
            .onAppear {
                viewModel.fetchFoodData()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationTitle("Categories")
    }

    private var categoriesSection: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading, 16)
                .shadow(color: .black, radius: 5, x: 0, y: 5)
            
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 4), spacing: 16) {
                ForEach(viewModel.categories ?? []) { category in
                    NavigationLink(destination: FoodCategoryView(category: category)) {
                        FoodCategoryCell(category: category)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 50)
    }
}

