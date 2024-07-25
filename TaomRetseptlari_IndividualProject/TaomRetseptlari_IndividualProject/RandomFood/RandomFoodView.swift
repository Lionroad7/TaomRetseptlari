//
//  RandomFoodView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI

struct RandomFoodView: View {
    @StateObject private var viewModel = RandomFoodViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                // Black background
                Color.black
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    if viewModel.isLoading {
                        FoodProgressView()
                            .transition(.opacity)
                    } else if let meal = viewModel.meal {
                        mealContent(meal: meal)
                    } else if let errorMessage = viewModel.errorMessage {
                        errorView(message: errorMessage)
                    }
                }
                .animation(.easeInOut(duration: 0.8), value: viewModel.isLoading)
            }
        }
    }
    
    @ViewBuilder
    private func mealContent(meal: Meal) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            titleView
            mealImageView(imageUrl: meal.imageUrlString, mealName: meal.name)
        }
        .padding()
        .transition(.opacity.combined(with: .slide))
    }
    
    @ViewBuilder
    private func mealImageView(imageUrl: String?, mealName: String) -> some View {
        if let url = imageUrl, let imageURL = URL(string: url) {
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgresssView().transition(.opacity)
                case .success(let image):
                    ZStack(alignment: .bottomLeading) {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 180)
                            .cornerRadius(20)
                            .shadow(color: .white, radius: 10, x: 0, y: 0)
                        
                        Text(mealName)
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(10)
                            .padding([.leading, .trailing], 10)
                            .padding(.vertical, 5)
                            .transition(.opacity)
                    }
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .transition(.opacity)
                @unknown default:
                    EmptyView().transition(.opacity)
                }
            }
        }
    }
    
    private var titleView: some View {
        VStack(alignment: .leading) {
            Text("Bugun nima")
                .fontWeight(.bold)
                .font(.system(size: 40))
                .foregroundColor(.white) // Changed to white for visibility on black background
            Text("PISHIRAMIZ?")
                .fontWeight(.bold)
                .font(.system(size: 50))
                .foregroundColor(.orange)
                .padding(.top, -35)
        }
        .lineLimit(2)
        .padding(.bottom, -5)
        .padding(.leading, 5)
    }
    
    @ViewBuilder
    private func errorView(message: String) -> some View {
        Text(message)
            .foregroundColor(.blue)
            .padding()
            .transition(.opacity)
    }
}


