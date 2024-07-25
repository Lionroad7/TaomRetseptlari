//
//  InstroctionView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

struct FoodDetailsInstructionsView: View {
    let meal: DetailedMeal

    var body: some View {
        ScrollView {
            Text(meal.getInstructionsText())
                .padding()
        }
        .navigationTitle("Instructions")
    }
}
