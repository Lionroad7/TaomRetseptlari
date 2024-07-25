//
//  FoodCategoryCell.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

struct FoodCategoryCell: View {
    let category: Category

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: category.imageUrlString)) { phase in
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
            .frame(height: 120)
            .cornerRadius(10)

            Text(category.name)
                .font(.subheadline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.top, 4)
        }
        .padding(4)
    }
}

