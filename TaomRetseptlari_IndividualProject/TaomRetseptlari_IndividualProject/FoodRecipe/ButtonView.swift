//
//  FoodRecipeViewModel.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI

struct CategoryButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}





