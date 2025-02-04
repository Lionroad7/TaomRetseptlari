//
//  Food.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import Foundation

struct Meal: Decodable, Hashable, Identifiable {
    let id: String
    let name: String
    let imageUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrlString = "strMealThumb"
    }
}

struct MealResponse: Decodable {
    let meals: [Meal]
}

