//
//  FoodDetailsMealInfoView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

struct FoodDetailsHeaderView: View {
    let meal: DetailedMeal

    var body: some View {
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
        .frame(height: 300)
        .cornerRadius(10)
    }
}


struct FoodDetailsMealInfoView: View {
    let meal: DetailedMeal

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(meal.name)
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                Button(meal.category) { }
                    .buttonStyle(CategoryButtonStyle(color: .orange))
                
                Button(meal.area) { }
                    .buttonStyle(CategoryButtonStyle(color: .green))
            }
            
            Text(meal.getTagsString())
                .font(.subheadline)
                .foregroundColor(.gray)
            
            NavigationLink(destination: FoodDetailsInstructionsView(meal: meal)) {
                HStack {
                    Image(systemName: "pencil")
                    Text("View Instructions")
                }
                .foregroundColor(.blue)
            }
            .padding(.top, 8)
        }
    }
}
