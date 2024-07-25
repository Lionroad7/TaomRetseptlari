//
//  FoodCategoryMealCell.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

struct FoodCategoryMealCell: View {
    let meal: Meal
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.imageUrlString)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                } else if phase.error != nil {
                    Color.red
                        .frame(width: 75, height: 75)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                } else {
                    Color.gray
                        .frame(width: 75, height: 75)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(meal.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.8), radius: 1, x: 1, y: 1)
            }
            .padding(.leading, 8)
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
    
    }
}

