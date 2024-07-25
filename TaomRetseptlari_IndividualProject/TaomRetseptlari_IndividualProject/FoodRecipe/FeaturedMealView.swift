//
//  FeaturedMealView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

struct FeaturedMealView: View {
    let meal: Meal

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: meal.imageUrlString)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else if phase.error != nil {
                    Color.red 
                } else {
                    Color.gray
                }
            }
            .frame(width: 200, height: 200)
            .cornerRadius(10)
            .overlay(
                Text(meal.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding(6),
                alignment: .bottom
            )
        }
        .padding(.trailing, 16)
    }
}
