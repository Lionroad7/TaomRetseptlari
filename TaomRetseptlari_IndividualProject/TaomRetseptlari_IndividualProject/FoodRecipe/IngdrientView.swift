//
//  IngdrientView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI
struct FoodDetailsIngredientView: View {
    let ingredient: String

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://www.themealdb.com/images/ingredients/\(ingredient.replacingOccurrences(of: " ", with: "%20")).png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Color.red
                } else {
                    Color.gray
                }
            }
            .frame(width: 50, height: 50)
            
            Text(ingredient)
                .font(.subheadline)
                .padding(.leading, 8)
        }
        .padding(.vertical, 4)
    }
}

